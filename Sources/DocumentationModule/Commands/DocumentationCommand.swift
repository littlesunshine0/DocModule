import Foundation

/// Commands available for documentation operations.
public enum DocumentationCommand: String, CaseIterable, Sendable {
    // Content commands
    case create
    case edit
    case delete
    case duplicate
    case move
    case rename
    
    // View commands
    case preview
    case export
    case print
    case share
    
    // Build commands
    case build
    case clean
    case rebuild
    case watch
    
    // Validation commands
    case validate
    case lint
    case checkLinks
    case spellCheck
    
    // Version commands
    case publish
    case unpublish
    case archive
    case restore
    
    // Search commands
    case search
    case findReplace
    case goToDefinition
    
    // Help commands
    case help
    case about
    case shortcuts
    case documentation
    
    public var displayName: String {
        switch self {
        case .create: return "Create New"
        case .edit: return "Edit"
        case .delete: return "Delete"
        case .duplicate: return "Duplicate"
        case .move: return "Move"
        case .rename: return "Rename"
        case .preview: return "Preview"
        case .export: return "Export"
        case .print: return "Print"
        case .share: return "Share"
        case .build: return "Build"
        case .clean: return "Clean"
        case .rebuild: return "Rebuild"
        case .watch: return "Watch"
        case .validate: return "Validate"
        case .lint: return "Lint"
        case .checkLinks: return "Check Links"
        case .spellCheck: return "Spell Check"
        case .publish: return "Publish"
        case .unpublish: return "Unpublish"
        case .archive: return "Archive"
        case .restore: return "Restore"
        case .search: return "Search"
        case .findReplace: return "Find & Replace"
        case .goToDefinition: return "Go to Definition"
        case .help: return "Help"
        case .about: return "About"
        case .shortcuts: return "Keyboard Shortcuts"
        case .documentation: return "Documentation"
        }
    }
    
    public var shortcut: String? {
        switch self {
        case .create: return "⌘N"
        case .edit: return "⌘E"
        case .delete: return "⌘⌫"
        case .duplicate: return "⌘D"
        case .move: return "⌘⇧M"
        case .rename: return "⏎"
        case .preview: return "⌘P"
        case .export: return "⌘⇧E"
        case .print: return "⌘⇧P"
        case .share: return "⌘⇧S"
        case .build: return "⌘B"
        case .clean: return "⌘⇧K"
        case .rebuild: return "⌘⇧B"
        case .watch: return "⌘⇧W"
        case .validate: return "⌘⇧V"
        case .lint: return "⌘L"
        case .checkLinks: return "⌘⇧L"
        case .spellCheck: return "⌘:"
        case .publish: return "⌘⇧↑"
        case .unpublish: return "⌘⇧↓"
        case .archive: return "⌘⇧A"
        case .restore: return "⌘⇧R"
        case .search: return "⌘F"
        case .findReplace: return "⌘⌥F"
        case .goToDefinition: return "⌘⌥D"
        case .help: return "⌘?"
        case .about: return nil
        case .shortcuts: return "⌘/"
        case .documentation: return "F1"
        }
    }
    
    public var icon: String {
        switch self {
        case .create: return "plus.circle"
        case .edit: return "pencil"
        case .delete: return "trash"
        case .duplicate: return "doc.on.doc"
        case .move: return "folder"
        case .rename: return "pencil.line"
        case .preview: return "eye"
        case .export: return "square.and.arrow.up"
        case .print: return "printer"
        case .share: return "square.and.arrow.up"
        case .build: return "hammer"
        case .clean: return "trash.circle"
        case .rebuild: return "arrow.clockwise"
        case .watch: return "eye.circle"
        case .validate: return "checkmark.shield"
        case .lint: return "wand.and.stars"
        case .checkLinks: return "link"
        case .spellCheck: return "textformat.abc"
        case .publish: return "arrow.up.circle"
        case .unpublish: return "arrow.down.circle"
        case .archive: return "archivebox"
        case .restore: return "arrow.uturn.backward"
        case .search: return "magnifyingglass"
        case .findReplace: return "arrow.left.arrow.right"
        case .goToDefinition: return "arrow.right.circle"
        case .help: return "questionmark.circle"
        case .about: return "info.circle"
        case .shortcuts: return "keyboard"
        case .documentation: return "book"
        }
    }
    
    public var category: CommandCategory {
        switch self {
        case .create, .edit, .delete, .duplicate, .move, .rename:
            return .content
        case .preview, .export, .print, .share:
            return .view
        case .build, .clean, .rebuild, .watch:
            return .build
        case .validate, .lint, .checkLinks, .spellCheck:
            return .validation
        case .publish, .unpublish, .archive, .restore:
            return .version
        case .search, .findReplace, .goToDefinition:
            return .search
        case .help, .about, .shortcuts, .documentation:
            return .help
        }
    }
    
    public var helpText: String {
        switch self {
        case .create: return "Create a new documentation item"
        case .edit: return "Edit the selected documentation"
        case .delete: return "Delete the selected documentation"
        case .duplicate: return "Create a copy of the selected documentation"
        case .move: return "Move documentation to a different location"
        case .rename: return "Rename the selected documentation"
        case .preview: return "Preview the documentation output"
        case .export: return "Export documentation to various formats"
        case .print: return "Print the documentation"
        case .share: return "Share documentation with others"
        case .build: return "Build the documentation"
        case .clean: return "Clean build artifacts"
        case .rebuild: return "Clean and rebuild documentation"
        case .watch: return "Watch for changes and rebuild automatically"
        case .validate: return "Validate documentation structure and content"
        case .lint: return "Check for style and formatting issues"
        case .checkLinks: return "Verify all links are valid"
        case .spellCheck: return "Check spelling in documentation"
        case .publish: return "Publish documentation to production"
        case .unpublish: return "Remove documentation from production"
        case .archive: return "Archive documentation for later reference"
        case .restore: return "Restore archived documentation"
        case .search: return "Search within documentation"
        case .findReplace: return "Find and replace text"
        case .goToDefinition: return "Navigate to symbol definition"
        case .help: return "Show help information"
        case .about: return "About this application"
        case .shortcuts: return "View keyboard shortcuts"
        case .documentation: return "Open documentation"
        }
    }
}

public enum CommandCategory: String, CaseIterable, Sendable {
    case content = "Content"
    case view = "View"
    case build = "Build"
    case validation = "Validation"
    case version = "Version"
    case search = "Search"
    case help = "Help"
    
    public var commands: [DocumentationCommand] {
        DocumentationCommand.allCases.filter { $0.category == self }
    }
}
