import Foundation
import SwiftData

/// A SwiftData model for documenting system requirements.
@Model
public final class RequirementsModel {
    public var id: UUID
    public var title: String
    public var functionalRequirements: [String]
    public var nonFunctionalRequirements: [String]
    public var dependencies: [String]
    public var priority: String
    public var owner: String
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.requirements
    public static let shape = DocumentationShape.square

    public init(
        id: UUID = UUID(),
        title: String,
        functionalRequirements: [String] = [],
        nonFunctionalRequirements: [String] = [],
        dependencies: [String] = [],
        priority: String = "medium",
        owner: String,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .requirements
    ) {
        self.id = id
        self.title = title
        self.functionalRequirements = functionalRequirements
        self.nonFunctionalRequirements = nonFunctionalRequirements
        self.dependencies = dependencies
        self.priority = priority
        self.owner = owner
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
