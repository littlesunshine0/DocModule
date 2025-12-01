import Foundation
import SwiftData

/// A question-answer pair in an FAQ.
public struct FAQEntry: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var question: String
    public var answer: String
    public var order: Int
    public var tags: [String]
    public var helpfulCount: Int
    public var notHelpfulCount: Int
    
    public init(
        id: UUID = UUID(),
        question: String,
        answer: String,
        order: Int = 0,
        tags: [String] = [],
        helpfulCount: Int = 0,
        notHelpfulCount: Int = 0
    ) {
        self.id = id
        self.question = question
        self.answer = answer
        self.order = order
        self.tags = tags
        self.helpfulCount = helpfulCount
        self.notHelpfulCount = notHelpfulCount
    }
}

/// A SwiftData model representing a FAQ collection.
@Model
public final class FAQModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var category: ContentCategory
    public var entriesData: Data
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var viewCount: Int
    
    public static let color = DocumentationColor.faq
    public static let shape = DocumentationShape.capsule
    
    public var entries: [FAQEntry] {
        get { (try? JSONDecoder().decode([FAQEntry].self, from: entriesData)) ?? [] }
        set { entriesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        category: ContentCategory = .fundamentals,
        entries: [FAQEntry] = [],
        icon: DocumentationIcon = .faq,
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
        self.entriesData = (try? JSONEncoder().encode(entries)) ?? Data()
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
