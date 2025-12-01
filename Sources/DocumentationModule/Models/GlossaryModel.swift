import Foundation
import SwiftData

/// A term definition in a glossary.
public struct GlossaryTerm: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var term: String
    public var definition: String
    public var pronunciation: String?
    public var relatedTerms: [String]
    public var seeAlso: [String]
    public var examples: [String]
    
    public init(
        id: UUID = UUID(),
        term: String,
        definition: String,
        pronunciation: String? = nil,
        relatedTerms: [String] = [],
        seeAlso: [String] = [],
        examples: [String] = []
    ) {
        self.id = id
        self.term = term
        self.definition = definition
        self.pronunciation = pronunciation
        self.relatedTerms = relatedTerms
        self.seeAlso = seeAlso
        self.examples = examples
    }
}

/// A SwiftData model representing a glossary of terms.
@Model
public final class GlossaryModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var category: ContentCategory
    public var termsData: Data
    public var icon: DocumentationIcon
    public var thumbnailURL: String?
    public var iconName: String
    public var sfSymbolFallback: String
    public var hooks: [String]
    public var additionalSections: [String]
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var viewCount: Int
    
    public static let color = DocumentationColor.glossary
    public static let shape = DocumentationShape.rectangle
    
    public var terms: [GlossaryTerm] {
        get { (try? JSONDecoder().decode([GlossaryTerm].self, from: termsData)) ?? [] }
        set { termsData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    /// Terms sorted alphabetically.
    public var sortedTerms: [GlossaryTerm] {
        terms.sorted { $0.term.lowercased() < $1.term.lowercased() }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        category: ContentCategory = .fundamentals,
        terms: [GlossaryTerm] = [],
        icon: DocumentationIcon = .glossary,
        thumbnailURL: String? = nil,
        iconName: String? = nil,
        sfSymbolFallback: String? = nil,
        hooks: [String] = [],
        additionalSections: [String] = [],
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.category = category
        self.termsData = (try? JSONEncoder().encode(terms)) ?? Data()
        self.icon = icon
        self.thumbnailURL = thumbnailURL
        self.iconName = iconName ?? icon.systemName
        self.sfSymbolFallback = sfSymbolFallback ?? icon.systemName
        self.hooks = hooks
        self.additionalSections = additionalSections
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
