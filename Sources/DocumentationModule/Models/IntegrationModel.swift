import Foundation
import SwiftData

/// A SwiftData model describing an integration guide between systems or services.
@Model
public final class IntegrationModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var platform: String
    public var description: String
    public var steps: [String]
    public var dependencies: [String]
    public var codeSamples: [String]
    public var compatibility: [String]
    public var maintainer: String
    public var status: String
    public var releasedAt: Date?
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var category: ContentCategory

    public static let color = DocumentationColor.integration
    public static let shape = DocumentationShape.roundedRectangle

    public init(
        id: UUID = UUID(),
        title: String,
        summary: String,
        platform: String,
        description: String,
        steps: [String] = [],
        dependencies: [String] = [],
        codeSamples: [String] = [],
        compatibility: [String] = [],
        maintainer: String,
        status: String = "beta",
        releasedAt: Date? = nil,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .integration,
        category: ContentCategory = .gettingStarted
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.platform = platform
        self.description = description
        self.steps = steps
        self.dependencies = dependencies
        self.codeSamples = codeSamples
        self.compatibility = compatibility
        self.maintainer = maintainer
        self.status = status
        self.releasedAt = releasedAt
        self.updatedAt = updatedAt
        self.icon = icon
        self.category = category
    }
}
