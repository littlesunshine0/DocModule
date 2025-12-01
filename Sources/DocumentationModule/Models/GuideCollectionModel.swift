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
        icon: DocumentationIcon = .guides
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.guideIDs = guideIDs
        self.curator = curator
        self.tags = tags
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
