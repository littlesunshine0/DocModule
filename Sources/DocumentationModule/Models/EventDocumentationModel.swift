import Foundation
import SwiftData

/// A SwiftData model capturing domain events, triggers, and payloads.
@Model
public final class EventDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var trigger: String
    public var payload: [String: String]
    public var consumers: [String]
    public var producers: [String]
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

    public static let color = DocumentationColor.event
    public static let shape = DocumentationShape.pentagon

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        trigger: String,
        payload: [String: String] = [:],
        consumers: [String] = [],
        producers: [String] = [],
        status: String = "draft",
        badge: String = "Event",
        priority: Int = 0,
        kind: String = "Event",
        category: ContentCategory = .fundamentals,
        type: DocumentationType = .event,
        icon: DocumentationIcon = .event,
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
        self.trigger = trigger
        self.payload = payload
        self.consumers = consumers
        self.producers = producers
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
