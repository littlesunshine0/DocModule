import Foundation
import SwiftData

/// A SwiftData model for documenting frameworks or methodologies.
@Model
public final class FrameworkModel {
    public var id: UUID
    public var name: String
    public var principles: [String]
    public var stages: [String]
    public var artifacts: [String]
    public var owner: String
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.framework
    public static let shape = DocumentationShape.circle

    public init(
        id: UUID = UUID(),
        name: String,
        principles: [String] = [],
        stages: [String] = [],
        artifacts: [String] = [],
        owner: String,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .framework,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.name = name
        self.principles = principles
        self.stages = stages
        self.artifacts = artifacts
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
