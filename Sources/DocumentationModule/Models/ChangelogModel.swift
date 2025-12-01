import Foundation
import SwiftData

/// A single change entry in a changelog.
public struct ChangeEntry: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var type: ChangeType
    public var description: String
    public var issueID: String?
    public var pullRequestID: String?
    
    public init(
        id: UUID = UUID(),
        type: ChangeType,
        description: String,
        issueID: String? = nil,
        pullRequestID: String? = nil
    ) {
        self.id = id
        self.type = type
        self.description = description
        self.issueID = issueID
        self.pullRequestID = pullRequestID
    }
}

/// Types of changes in a changelog.
public enum ChangeType: String, Codable, Sendable, CaseIterable {
    case added
    case changed
    case deprecated
    case removed
    case fixed
    case security
    
    public var displayName: String { rawValue.capitalized }
    
    public var emoji: String {
        switch self {
        case .added: return "✨"
        case .changed: return "🔄"
        case .deprecated: return "⚠️"
        case .removed: return "🗑️"
        case .fixed: return "🐛"
        case .security: return "🔒"
        }
    }
}

/// A SwiftData model representing version changelog/release notes.
@Model
public final class ChangelogModel {
    public var id: UUID
    public var version: String
    public var releaseDate: Date
    public var summary: String
    public var changesData: Data
    public var isPrerelease: Bool
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
    
    public static let color = DocumentationColor.changelog
    public static let shape = DocumentationShape.diamond
    
    public var changes: [ChangeEntry] {
        get { (try? JSONDecoder().decode([ChangeEntry].self, from: changesData)) ?? [] }
        set { changesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        version: String,
        releaseDate: Date = Date(),
        summary: String = "",
        changes: [ChangeEntry] = [],
        isPrerelease: Bool = false,
        icon: DocumentationIcon = .changelog,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false
    ) {
        self.id = id
        self.version = version
        self.releaseDate = releaseDate
        self.summary = summary
        self.changesData = (try? JSONEncoder().encode(changes)) ?? Data()
        self.isPrerelease = isPrerelease
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
    }
}
