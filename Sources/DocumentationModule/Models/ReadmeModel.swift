import Foundation
import SwiftData

/// A SwiftData model for README-style project introductions.
@Model
public final class ReadmeModel {
    public var id: UUID
    public var projectName: String
    public var summary: String
    public var installation: String
    public var usage: String
    public var contributing: String
    public var license: String
    public var badges: [String]
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.readme
    public static let shape = DocumentationShape.roundedSquare

    public init(
        id: UUID = UUID(),
        projectName: String,
        summary: String,
        installation: String,
        usage: String,
        contributing: String,
        license: String,
        badges: [String] = [],
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .readme,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.projectName = projectName
        self.summary = summary
        self.installation = installation
        self.usage = usage
        self.contributing = contributing
        self.license = license
        self.badges = badges
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
