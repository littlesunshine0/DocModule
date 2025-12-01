import Foundation
import SwiftData

/// A SwiftData model for policies, standards, and compliance requirements.
@Model
public final class PolicyModel {
    public var id: UUID
    public var title: String
    public var scope: String
    public var rules: [String]
    public var complianceStandards: [String]
    public var reviewCycleDays: Int
    public var approver: String
    public var effectiveDate: Date?
    public var updatedAt: Date
    public var icon: DocumentationIcon

    public static let color = DocumentationColor.policy
    public static let shape = DocumentationShape.diamond

    public init(
        id: UUID = UUID(),
        title: String,
        scope: String,
        rules: [String] = [],
        complianceStandards: [String] = [],
        reviewCycleDays: Int = 365,
        approver: String,
        effectiveDate: Date? = nil,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .policy
    ) {
        self.id = id
        self.title = title
        self.scope = scope
        self.rules = rules
        self.complianceStandards = complianceStandards
        self.reviewCycleDays = reviewCycleDays
        self.approver = approver
        self.effectiveDate = effectiveDate
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
