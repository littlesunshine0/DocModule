import Foundation
import SwiftData

/// A SwiftData model for capturing product use cases and value stories.
@Model
public final class UseCaseModel {
    public var id: UUID
    public var title: String
    public var audience: String
    public var problem: String
    public var solutionOverview: String
    public var metrics: [String: Double]
    public var steps: [String]
    public var tags: [String]
    public var author: String
    public var createdAt: Date
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.useCase
    public static let shape = DocumentationShape.hexagon

    public init(
        id: UUID = UUID(),
        title: String,
        audience: String,
        problem: String,
        solutionOverview: String,
        metrics: [String: Double] = [:],
        steps: [String] = [],
        tags: [String] = [],
        author: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .useCase
    ) {
        self.id = id
        self.title = title
        self.audience = audience
        self.problem = problem
        self.solutionOverview = solutionOverview
        self.metrics = metrics
        self.steps = steps
        self.tags = tags
        self.author = author
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
