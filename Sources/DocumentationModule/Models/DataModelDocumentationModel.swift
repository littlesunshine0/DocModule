import Foundation
import SwiftData

/// A SwiftData model describing data model definitions and schemas.
@Model
public final class DataModelDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var entities: [String]
    public var fields: [String]
    public var relationships: [String]
    public var constraints: [String]
    public var status: String
    public var badge: String
    public var priority: Int
    public var kind: String
    public var category: ContentCategory
    public var type: DocumentationType
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date

    public static let color = DocumentationColor.dataModel
    public static let shape = DocumentationShape.square

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        entities: [String] = [],
        fields: [String] = [],
        relationships: [String] = [],
        constraints: [String] = [],
        status: String = "draft",
        badge: String = "Data",
        priority: Int = 0,
        kind: String = "Data Model",
        category: ContentCategory = .advanced,
        type: DocumentationType = .dataModel,
        icon: DocumentationIcon = .dataModel,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.entities = entities
        self.fields = fields
        self.relationships = relationships
        self.constraints = constraints
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
