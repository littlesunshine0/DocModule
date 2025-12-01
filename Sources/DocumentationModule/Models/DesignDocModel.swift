import Foundation
import SwiftData

/// A SwiftData model for design documents and decision records.
@Model
public final class DesignDocModel {
    public var id: UUID
    public var title: String
    public var objective: String
    public var constraints: [String]
    public var decisions: [String]
    public var alternatives: [String]
    public var diagrams: [String]
    public var reviewers: [String]
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.design
    public static let shape = DocumentationShape.octagon

    public init(
        id: UUID = UUID(),
        title: String,
        objective: String,
        constraints: [String] = [],
        decisions: [String] = [],
        alternatives: [String] = [],
        diagrams: [String] = [],
        reviewers: [String] = [],
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .design
    ) {
        self.id = id
        self.title = title
        self.objective = objective
        self.constraints = constraints
        self.decisions = decisions
        self.alternatives = alternatives
        self.diagrams = diagrams
        self.reviewers = reviewers
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
