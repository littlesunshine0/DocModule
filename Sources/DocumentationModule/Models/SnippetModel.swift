import Foundation
import SwiftData

/// Programming language for code snippets.
public enum ProgrammingLanguage: String, Codable, Sendable, CaseIterable {
    case swift, objectiveC, python, javascript, typescript
    case java, kotlin, csharp, cpp, c, rust, go
    case ruby, php, html, css, sql, shell, yaml, json
    
    public var displayName: String {
        switch self {
        case .swift: return "Swift"
        case .objectiveC: return "Objective-C"
        case .python: return "Python"
        case .javascript: return "JavaScript"
        case .typescript: return "TypeScript"
        case .java: return "Java"
        case .kotlin: return "Kotlin"
        case .csharp: return "C#"
        case .cpp: return "C++"
        case .c: return "C"
        case .rust: return "Rust"
        case .go: return "Go"
        case .ruby: return "Ruby"
        case .php: return "PHP"
        case .html: return "HTML"
        case .css: return "CSS"
        case .sql: return "SQL"
        case .shell: return "Shell"
        case .yaml: return "YAML"
        case .json: return "JSON"
        }
    }
    
    public var fileExtension: String {
        switch self {
        case .swift: return "swift"
        case .objectiveC: return "m"
        case .python: return "py"
        case .javascript: return "js"
        case .typescript: return "ts"
        case .java: return "java"
        case .kotlin: return "kt"
        case .csharp: return "cs"
        case .cpp: return "cpp"
        case .c: return "c"
        case .rust: return "rs"
        case .go: return "go"
        case .ruby: return "rb"
        case .php: return "php"
        case .html: return "html"
        case .css: return "css"
        case .sql: return "sql"
        case .shell: return "sh"
        case .yaml: return "yaml"
        case .json: return "json"
        }
    }
}

/// A SwiftData model representing a reusable code snippet.
@Model
public final class SnippetModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var code: String
    public var language: ProgrammingLanguage
    public var tags: [String]
    public var category: ContentCategory
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var copyCount: Int
    public var viewCount: Int
    
    public static let color = DocumentationColor.snippet
    public static let shape = DocumentationShape.roundedSquare
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        code: String,
        language: ProgrammingLanguage = .swift,
        tags: [String] = [],
        category: ContentCategory = .samples,
        icon: DocumentationIcon = .snippet,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        copyCount: Int = 0,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.code = code
        self.language = language
        self.tags = tags
        self.category = category
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.copyCount = copyCount
        self.viewCount = viewCount
    }
}
