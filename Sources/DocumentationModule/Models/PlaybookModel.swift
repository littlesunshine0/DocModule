import Foundation
import SwiftData

/// A SwiftData model for operational playbooks and repeatable procedures.
@Model
public final class PlaybookModel {
    public var id: UUID
    public var title: String
    public var goal: String
    public var scenarios: [String]
    public var checklist: [String]
    public var owner: String
    public var audience: String
    public var lastTestedAt: Date?
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.playbook
    public static let shape = DocumentationShape.rectangle

    public init(
        id: UUID = UUID(),
        title: String,
        goal: String,
        scenarios: [String] = [],
        checklist: [String] = [],
        owner: String,
        audience: String,
        lastTestedAt: Date? = nil,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .playbook
    ) {
        self.id = id
        self.title = title
        self.goal = goal
        self.scenarios = scenarios
        self.checklist = checklist
        self.owner = owner
        self.audience = audience
        self.lastTestedAt = lastTestedAt
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
