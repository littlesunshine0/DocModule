import Foundation
import SwiftData

/// A SwiftData model describing a service contract and operational details.
@Model
public final class ServiceDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var endpoints: [String]
    public var protocols: [String]
    public var dependencies: [String]
    public var sla: String
    public var ownerTeam: String
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

    public static let color = DocumentationColor.service
    public static let shape = DocumentationShape.roundedRectangle

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        endpoints: [String] = [],
        protocols: [String] = [],
        dependencies: [String] = [],
        sla: String = "99.9%",
        ownerTeam: String,
        status: String = "draft",
        badge: String = "Service",
        priority: Int = 0,
        kind: String = "Service",
        category: ContentCategory = .api,
        type: DocumentationType = .service,
        icon: DocumentationIcon = .service,
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
        self.endpoints = endpoints
        self.protocols = protocols
        self.dependencies = dependencies
        self.sla = sla
        self.ownerTeam = ownerTeam
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
