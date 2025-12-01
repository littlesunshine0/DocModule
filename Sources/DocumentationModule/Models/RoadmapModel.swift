import Foundation
import SwiftData

public struct RoadmapMilestone: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var description: String
    public var targetDate: Date?
    public var status: String

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        targetDate: Date? = nil,
        status: String = "planned"
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.targetDate = targetDate
        self.status = status
    }
}

/// A SwiftData model capturing product or documentation roadmaps.
@Model
public final class RoadmapModel {
    public var id: UUID
    public var title: String
    public var horizon: String
    public var themes: [String]
    public var milestones: [RoadmapMilestone]
    public var owner: String
    public var status: String
    public var createdAt: Date
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.roadmap
    public static let shape = DocumentationShape.stadium

    public init(
        id: UUID = UUID(),
        title: String,
        horizon: String,
        themes: [String] = [],
        milestones: [RoadmapMilestone] = [],
        owner: String,
        status: String = "draft",
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .roadmap,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.title = title
        self.horizon = horizon
        self.themes = themes
        self.milestones = milestones
        self.owner = owner
        self.status = status
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
