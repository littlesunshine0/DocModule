import Foundation
import SwiftData

/// A problem-solution pair in troubleshooting.
public struct TroubleshootingEntry: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var symptom: String
    public var cause: String
    public var solution: String
    public var stepsData: Data
    public var errorCodes: [String]
    public var platforms: [String]
    public var severity: IssueSeverity
    
    public var steps: [String] {
        get { (try? JSONDecoder().decode([String].self, from: stepsData)) ?? [] }
        set { stepsData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        symptom: String,
        cause: String,
        solution: String,
        steps: [String] = [],
        errorCodes: [String] = [],
        platforms: [String] = [],
        severity: IssueSeverity = .medium
    ) {
        self.id = id
        self.symptom = symptom
        self.cause = cause
        self.solution = solution
        self.stepsData = (try? JSONEncoder().encode(steps)) ?? Data()
        self.errorCodes = errorCodes
        self.platforms = platforms
        self.severity = severity
    }
}

/// Severity levels for issues.
public enum IssueSeverity: String, Codable, Sendable, CaseIterable {
    case low, medium, high, critical
    
    public var displayName: String { rawValue.capitalized }
    
    public var emoji: String {
        switch self {
        case .low: return "🟢"
        case .medium: return "🟡"
        case .high: return "🟠"
        case .critical: return "🔴"
        }
    }
}

/// A SwiftData model representing troubleshooting documentation.
@Model
public final class TroubleshootingModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var category: ContentCategory
    public var entriesData: Data
    public var relatedArticleIDs: [UUID]
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
    public var viewCount: Int
    public var resolvedCount: Int
    
    public static let color = DocumentationColor.troubleshooting
    public static let shape = DocumentationShape.triangle
    
    public var entries: [TroubleshootingEntry] {
        get { (try? JSONDecoder().decode([TroubleshootingEntry].self, from: entriesData)) ?? [] }
        set { entriesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        category: ContentCategory = .troubleshooting,
        entries: [TroubleshootingEntry] = [],
        relatedArticleIDs: [UUID] = [],
        icon: DocumentationIcon = .troubleshooting,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0,
        resolvedCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.category = category
        self.entriesData = (try? JSONEncoder().encode(entries)) ?? Data()
        self.relatedArticleIDs = relatedArticleIDs
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
        self.viewCount = viewCount
        self.resolvedCount = resolvedCount
    }
}
