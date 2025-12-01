import Foundation
import SwiftData

/// A file in a sample project.
public struct SampleFile: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var path: String
    public var content: String
    public var language: ProgrammingLanguage
    public var isHighlighted: Bool
    public var annotations: [FileAnnotation]
    
    public init(
        id: UUID = UUID(),
        path: String,
        content: String,
        language: ProgrammingLanguage = .swift,
        isHighlighted: Bool = false,
        annotations: [FileAnnotation] = []
    ) {
        self.id = id
        self.path = path
        self.content = content
        self.language = language
        self.isHighlighted = isHighlighted
        self.annotations = annotations
    }
}

/// An annotation on a file (line comment, highlight, etc).
public struct FileAnnotation: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var lineStart: Int
    public var lineEnd: Int
    public var comment: String
    public var type: AnnotationType
    
    public init(
        id: UUID = UUID(),
        lineStart: Int,
        lineEnd: Int,
        comment: String,
        type: AnnotationType = .info
    ) {
        self.id = id
        self.lineStart = lineStart
        self.lineEnd = lineEnd
        self.comment = comment
        self.type = type
    }
}

public enum AnnotationType: String, Codable, Sendable {
    case info, warning, important, tip
}

/// A SwiftData model representing a complete sample project.
@Model
public final class SampleModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var filesData: Data
    public var repositoryURL: String?
    public var downloadURL: String?
    public var platforms: [String]
    public var minimumVersion: String?
    public var dependencies: [String]
    public var category: ContentCategory
    public var tags: [String]
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var downloadCount: Int
    public var viewCount: Int
    
    public static let color = DocumentationColor.sample
    public static let shape = DocumentationShape.pentagon
    
    public var files: [SampleFile] {
        get { (try? JSONDecoder().decode([SampleFile].self, from: filesData)) ?? [] }
        set { filesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        files: [SampleFile] = [],
        repositoryURL: String? = nil,
        downloadURL: String? = nil,
        platforms: [String] = ["iOS", "macOS"],
        minimumVersion: String? = nil,
        dependencies: [String] = [],
        category: ContentCategory = .samples,
        tags: [String] = [],
        icon: DocumentationIcon = .sample,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        downloadCount: Int = 0,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.filesData = (try? JSONEncoder().encode(files)) ?? Data()
        self.repositoryURL = repositoryURL
        self.downloadURL = downloadURL
        self.platforms = platforms
        self.minimumVersion = minimumVersion
        self.dependencies = dependencies
        self.category = category
        self.tags = tags
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.downloadCount = downloadCount
        self.viewCount = viewCount
    }
}
