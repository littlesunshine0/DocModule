import Foundation
import SwiftData

/// A SwiftData model describing a view model and presentation logic contract.
@Model
public final class ViewModelDocumentationModel {
    public var id: UUID
    public var name: String
    public var summary: String
    public var responsibilities: [String]
    public var inputs: [String]
    public var outputs: [String]
    public var dependencies: [String]
    public var status: String
    public var badge: String
    public var priority: Int
    public var kind: String
    public var category: ContentCategory
    public var type: DocumentationType
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]
    public var createdAt: Date
    public var updatedAt: Date

    public static let color = DocumentationColor.viewModel
    public static let shape = DocumentationShape.roundedSquare

    public init(
        id: UUID = UUID(),
        name: String,
        summary: String,
        responsibilities: [String] = [],
        inputs: [String] = [],
        outputs: [String] = [],
        dependencies: [String] = [],
        status: String = "draft",
        badge: String = "VM",
        priority: Int = 0,
        kind: String = "ViewModel",
        category: ContentCategory = .advanced,
        type: DocumentationType = .viewModel,
        icon: DocumentationIcon = .viewModel,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.responsibilities = responsibilities
        self.inputs = inputs
        self.outputs = outputs
        self.dependencies = dependencies
        self.status = status
        self.badge = badge
        self.priority = priority
        self.kind = kind
        self.category = category
        self.type = type
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
