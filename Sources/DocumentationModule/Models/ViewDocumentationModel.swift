import Foundation
import SwiftData

/// A SwiftData model describing a UI view specification.
@Model
public final class ViewDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var platform: String
    public var layoutDescription: String
    public var states: [String]
    public var interactions: [String]
    public var dependencies: [String]
    public var status: String
    public var badge: String
    public var priority: Int
    public var kind: String
    public var category: ContentCategory
    public var type: DocumentationType
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date

    public static let color = DocumentationColor.view
    public static let shape = DocumentationShape.rectangle

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        platform: String,
        layoutDescription: String,
        states: [String] = [],
        interactions: [String] = [],
        dependencies: [String] = [],
        status: String = "draft",
        badge: String = "UI",
        priority: Int = 0,
        kind: String = "View",
        category: ContentCategory = .fundamentals,
        type: DocumentationType = .view,
        icon: DocumentationIcon = .view,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.platform = platform
        self.layoutDescription = layoutDescription
        self.states = states
        self.interactions = interactions
        self.dependencies = dependencies
        self.status = status
        self.badge = badge
        self.priority = priority
        self.kind = kind
        self.category = category
        self.type = type
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
