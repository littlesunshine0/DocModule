import Foundation
import SwiftData

/// A SwiftData model for tracking checkpoints and validation gates.
@Model
public final class CheckpointDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var criteria: [String]
    public var owner: String
    public var dueDate: Date?
    public var status: String
    public var badge: String
    public var priority: Int
    public var kind: String
    public var category: ContentCategory
    public var type: DocumentationType
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date

    public static let color = DocumentationColor.checkpoint
    public static let shape = DocumentationShape.capsule

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        criteria: [String] = [],
        owner: String,
        dueDate: Date? = nil,
        status: String = "planned",
        badge: String = "Checkpoint",
        priority: Int = 0,
        kind: String = "Checkpoint",
        category: ContentCategory = .migration,
        type: DocumentationType = .checkpoint,
        icon: DocumentationIcon = .checkpoint,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.criteria = criteria
        self.owner = owner
        self.dueDate = dueDate
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
