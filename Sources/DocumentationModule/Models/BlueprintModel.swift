import Foundation
import SwiftData

/// A SwiftData model for high-level architecture blueprints.
@Model
public final class BlueprintModel {
    public var id: UUID
    public var title: String
    public var architectureOverview: String
    public var components: [String]
    public var integrations: [String]
    public var risks: [String]
    public var assumptions: [String]
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.blueprint
    public static let shape = DocumentationShape.triangle

    public init(
        id: UUID = UUID(),
        title: String,
        architectureOverview: String,
        components: [String] = [],
        integrations: [String] = [],
        risks: [String] = [],
        assumptions: [String] = [],
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .blueprint,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.title = title
        self.architectureOverview = architectureOverview
        self.components = components
        self.integrations = integrations
        self.risks = risks
        self.assumptions = assumptions
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
