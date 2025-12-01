import Foundation
import SwiftData

/// A SwiftData model capturing coordinator and manager responsibilities.
@Model
public final class ManagerDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var responsibilities: [String]
    public var collaborators: [String]
    public var decisionLog: [String]
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

    public static let color = DocumentationColor.manager
    public static let shape = DocumentationShape.diamond

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        responsibilities: [String] = [],
        collaborators: [String] = [],
        decisionLog: [String] = [],
        status: String = "draft",
        badge: String = "Manager",
        priority: Int = 0,
        kind: String = "Manager",
        category: ContentCategory = .bestPractices,
        type: DocumentationType = .manager,
        icon: DocumentationIcon = .manager,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.responsibilities = responsibilities
        self.collaborators = collaborators
        self.decisionLog = decisionLog
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
