import Foundation
import SwiftData

/// A SwiftData model representing a curated collection of guides.
@Model
public final class GuideCollectionModel {
    public var id: UUID
    public var title: String
    public var description: String
    public var guideIDs: [UUID]
    public var curator: String
    public var tags: [String]
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.guides
    public static let shape = DocumentationShape.pentagon

    public init(
        id: UUID = UUID(),
        title: String,
        description: String,
        guideIDs: [UUID] = [],
        curator: String,
        tags: [String] = [],
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .guides,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.guideIDs = guideIDs
        self.curator = curator
        self.tags = tags
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
