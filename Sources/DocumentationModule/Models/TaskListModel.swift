import Foundation
import SwiftData

public struct TaskItem: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var details: String
    public var dueDate: Date?
    public var status: String

    public init(
        id: UUID = UUID(),
        title: String,
        details: String,
        dueDate: Date? = nil,
        status: String = "pending"
    ) {
        self.id = id
        self.title = title
        self.details = details
        self.dueDate = dueDate
        self.status = status
    }
}

/// A SwiftData model representing a checklist or task list.
@Model
public final class TaskListModel {
    public var id: UUID
    public var title: String
    public var description: String
    public var tasks: [TaskItem]
    public var owner: String
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.tasks
    public static let shape = DocumentationShape.capsule

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        tasks: [TaskItem] = [],
        owner: String,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .tasks
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.tasks = tasks
        self.owner = owner
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
