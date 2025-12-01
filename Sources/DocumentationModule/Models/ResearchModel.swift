import Foundation
import SwiftData

/// A SwiftData model for research notes, experiments, and findings.
@Model
public final class ResearchModel {
    public var id: UUID
    public var title: String
    public var hypothesis: String
    public var methodology: String
    public var findings: String
    public var dataSources: [String]
    public var tags: [String]
    public var author: String
    public var publishedAt: Date?
    public var updatedAt: Date
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]

    public static let color = DocumentationColor.research
    public static let shape = DocumentationShape.shield

    public init(
        id: UUID = UUID(),
        title: String,
        hypothesis: String,
        methodology: String,
        findings: String,
        dataSources: [String] = [],
        tags: [String] = [],
        author: String,
        publishedAt: Date? = nil,
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .research,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = []
    ) {
        self.id = id
        self.title = title
        self.hypothesis = hypothesis
        self.methodology = methodology
        self.findings = findings
        self.dataSources = dataSources
        self.tags = tags
        self.author = author
        self.publishedAt = publishedAt
        self.updatedAt = updatedAt
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
    }
}
