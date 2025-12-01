import Foundation
import SwiftData

/// A SwiftData model for miscellaneous documentation assets.
@Model
public final class OtherDocumentationModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var details: String
    public var tags: [String]
    public var owner: String
    public var status: String
    public var badge: String
    public var priority: Int
    public var kind: String
    public var category: ContentCategory
    public var type: DocumentationType
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]
    public var createdAt: Date
    public var updatedAt: Date

    public static let color = DocumentationColor.otherDocumentation
    public static let shape = DocumentationShape.parallelogram

    public init(
        id: UUID = UUID(),
        title: String,
        summary: String,
        details: String,
        tags: [String] = [],
        owner: String,
        status: String = "draft",
        badge: String = "Doc",
        priority: Int = 0,
        kind: String = "Other",
        category: ContentCategory = .fundamentals,
        type: DocumentationType = .otherDocumentation,
        icon: DocumentationIcon = .otherDocumentation,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.details = details
        self.tags = tags
        self.owner = owner
        self.status = status
        self.badge = badge
        self.priority = priority
        self.kind = kind
        self.category = category
        self.type = type
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
