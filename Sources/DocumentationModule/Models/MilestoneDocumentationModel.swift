import Foundation
import SwiftData

/// A SwiftData model for major delivery milestones.
@Model
public final class MilestoneDocumentationModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var goals: [String]
    public var dueDate: Date?
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

    public static let color = DocumentationColor.milestone
    public static let shape = DocumentationShape.triangle

    public init(
        id: UUID = UUID(),
        title: String,
        summary: String,
        goals: [String] = [],
        dueDate: Date? = nil,
        owner: String,
        status: String = "planned",
        badge: String = "Milestone",
        priority: Int = 0,
        kind: String = "Milestone",
        category: ContentCategory = .roadmap,
        type: DocumentationType = .milestone,
        icon: DocumentationIcon = .milestone,
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
        self.goals = goals
        self.dueDate = dueDate
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
