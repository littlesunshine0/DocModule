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
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.tasks
    public static let shape = DocumentationShape.capsule

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        tasks: [TaskItem] = [],
        owner: String,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .tasks,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.tasks = tasks
        self.owner = owner
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
