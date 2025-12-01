import Foundation
import SwiftData

/// A code example with language and description.
public struct CodeExample: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var code: String
    public var language: String
    public var description: String?
    
    public init(
        id: UUID = UUID(),
        title: String,
        code: String,
        language: String = "swift",
        description: String? = nil
    ) {
        self.id = id
        self.title = title
        self.code = code
        self.language = language
        self.description = description
    }
}

/// A SwiftData model representing API reference documentation.
///
/// References provide technical documentation for APIs, including
/// descriptions, related APIs, and code examples.
///
/// ## Overview
///
/// ReferenceModel is designed for technical API documentation.
/// Use references for:
/// - API documentation
/// - Method and property descriptions
/// - Type references
/// - Protocol conformance guides
///
/// ## Visual Identity
///
/// - Icon: ``DocumentationIcon/reference`` (curlybraces)
/// - Color: ``DocumentationColor/reference`` (purple)
/// - Shape: ``DocumentationShape/reference`` (square)
///
/// ## Example
///
/// ```swift
/// let reference = ReferenceModel(
///     title: "Array.map(_:)",
///     content: "Returns an array containing the results of mapping...",
///     category: .api,
///     relatedAPIs: ["Array.compactMap(_:)", "Array.flatMap(_:)"]
/// )
/// ```
@Model
public final class ReferenceModel {
    /// Unique identifier for the reference.
    public var id: UUID
    
    /// The title of the reference (usually API name).
    public var title: String
    
    /// Detailed content describing the API.
    public var content: String
    
    /// Category for organizing the reference.
    public var category: ContentCategory
    
    /// Names of related APIs for cross-referencing.
    public var relatedAPIs: [String]
    
    /// JSON-encoded array of code examples.
    public var codeExamplesData: Data
    
    /// Icon identifier for the reference.
    public var icon: DocumentationIcon
    
    /// When the reference was created.
    public var createdAt: Date
    
    /// When the reference was last updated.
    public var updatedAt: Date
    
    /// ID of the user who created the reference.
    public var userID: String
    
    /// Whether the reference is published and visible.
    public var isPublished: Bool
    
    /// Number of times the reference has been viewed.
    public var viewCount: Int
    
    /// The color associated with references.
    public static let color = DocumentationColor.reference
    
    /// The shape associated with references.
    public static let shape = DocumentationShape.square
    
    /// Decoded code examples from codeExamplesData.
    public var codeExamples: [CodeExample] {
        get {
            (try? JSONDecoder().decode([CodeExample].self, from: codeExamplesData)) ?? []
        }
        set {
            codeExamplesData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        content: String,
        category: ContentCategory = .api,
        relatedAPIs: [String] = [],
        codeExamples: [CodeExample] = [],
        icon: DocumentationIcon = .reference,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.category = category
        self.relatedAPIs = relatedAPIs
        self.codeExamplesData = (try? JSONEncoder().encode(codeExamples)) ?? Data()
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
