import Foundation

/// Actions that can be performed on documentation.
public protocol DocumentationAction: Sendable {
    var id: String { get }
    var name: String { get }
    var icon: String { get }
    var isEnabled: Bool { get }
    func execute() async throws -> ActionResult
    func undo() async throws
}

/// Result of an action execution.
public struct ActionResult: Sendable {
    public let success: Bool
    public let message: String
    public let data: [String: String]?
    public let undoable: Bool
    
    public init(
        success: Bool,
        message: String,
        data: [String: String]? = nil,
        undoable: Bool = false
    ) {
        self.success = success
        self.message = message
        self.data = data
        self.undoable = undoable
    }
    
    public static func success(_ message: String, undoable: Bool = false) -> ActionResult {
        ActionResult(success: true, message: message, undoable: undoable)
    }
    
    public static func failure(_ message: String) -> ActionResult {
        ActionResult(success: false, message: message)
    }
}

/// Create documentation action.
public struct CreateDocumentationAction: DocumentationAction {
    public let id = "create"
    public let name = "Create Documentation"
    public let icon = "plus.circle"
    public let isEnabled = true
    
    public let type: DocumentationType
    public let title: String
    public let content: String
    
    private var createdID: UUID?
    
    public init(type: DocumentationType, title: String, content: String = "") {
        self.type = type
        self.title = title
        self.content = content
    }
    
    public func execute() async throws -> ActionResult {
        // In real implementation, this would create in SwiftData
        let id = UUID()
        return ActionResult.success("Created \(type.displayName): \(title)", undoable: true)
    }
    
    public func undo() async throws {
        // Delete the created item
    }
}

/// Delete documentation action.
public struct DeleteDocumentationAction: DocumentationAction {
    public let id = "delete"
    public let name = "Delete Documentation"
    public let icon = "trash"
    public let isEnabled = true
    
    public let documentID: UUID
    private var deletedContent: DocumentationContent?
    
    public init(documentID: UUID) {
        self.documentID = documentID
    }
    
    public func execute() async throws -> ActionResult {
        // Store content for undo, then delete
        return ActionResult.success("Deleted documentation", undoable: true)
    }
    
    public func undo() async throws {
        // Restore deleted content
    }
}

/// Publish documentation action.
public struct PublishDocumentationAction: DocumentationAction {
    public let id = "publish"
    public let name = "Publish Documentation"
    public let icon = "arrow.up.circle"
    public let isEnabled = true
    
    public let documentIDs: [UUID]
    
    public init(documentIDs: [UUID]) {
        self.documentIDs = documentIDs
    }
    
    public func execute() async throws -> ActionResult {
        return ActionResult.success("Published \(documentIDs.count) document(s)", undoable: true)
    }
    
    public func undo() async throws {
        // Unpublish
    }
}

/// Export documentation action.
public struct ExportDocumentationAction: DocumentationAction {
    public let id = "export"
    public let name = "Export Documentation"
    public let icon = "square.and.arrow.up"
    public let isEnabled = true
    
    public let documentIDs: [UUID]
    public let format: DocumentationGenerator.OutputFormat
    public let outputPath: String
    
    public init(documentIDs: [UUID], format: DocumentationGenerator.OutputFormat, outputPath: String) {
        self.documentIDs = documentIDs
        self.format = format
        self.outputPath = outputPath
    }
    
    public func execute() async throws -> ActionResult {
        return ActionResult.success("Exported to \(outputPath)")
    }
    
    public func undo() async throws {
        // Cannot undo export
    }
}

/// Validate documentation action.
public struct ValidateDocumentationAction: DocumentationAction {
    public let id = "validate"
    public let name = "Validate Documentation"
    public let icon = "checkmark.shield"
    public let isEnabled = true
    
    public let content: [DocumentationContent]
    
    public init(content: [DocumentationContent]) {
        self.content = content
    }
    
    public func execute() async throws -> ActionResult {
        let parser = DocumentationParser()
        var totalErrors = 0
        
        for item in content {
            let errors = parser.validate(item.content)
            totalErrors += errors.count
        }
        
        if totalErrors == 0 {
            return ActionResult.success("Validation passed")
        } else {
            return ActionResult.failure("Validation failed with \(totalErrors) error(s)")
        }
    }
    
    public func undo() async throws {
        // Cannot undo validation
    }
}

/// Action dispatcher for managing action execution.
public actor ActionDispatcher {
    private var history: [any DocumentationAction] = []
    private var redoStack: [any DocumentationAction] = []
    private let maxHistorySize: Int
    
    public init(maxHistorySize: Int = 100) {
        self.maxHistorySize = maxHistorySize
    }
    
    /// Execute an action.
    public func execute(_ action: any DocumentationAction) async throws -> ActionResult {
        let result = try await action.execute()
        
        if result.undoable {
            history.append(action)
            if history.count > maxHistorySize {
                history.removeFirst()
            }
            redoStack.removeAll()
        }
        
        return result
    }
    
    /// Undo the last action.
    public func undo() async throws {
        guard let action = history.popLast() else { return }
        try await action.undo()
        redoStack.append(action)
    }
    
    /// Redo the last undone action.
    public func redo() async throws {
        guard let action = redoStack.popLast() else { return }
        _ = try await action.execute()
        history.append(action)
    }
    
    public var canUndo: Bool {
        get async { !history.isEmpty }
    }
    
    public var canRedo: Bool {
        get async { !redoStack.isEmpty }
    }
}
