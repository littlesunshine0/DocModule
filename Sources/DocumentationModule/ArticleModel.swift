import Foundation
import SwiftData

/// A SwiftData model representing a long-form article.
///
/// Articles are free-form written content such as blog posts, announcements,
/// or in-depth explanations. Unlike guides, articles don't have a strict
/// step-by-step structure.
///
/// ## Overview
///
/// ArticleModel is designed for narrative content that informs or explains.
/// Use articles for:
/// - Blog posts and announcements
/// - Conceptual explanations
/// - Opinion pieces and best practices
/// - News and updates
///
/// ## Visual Identity
///
/// - Icon: ``DocumentationIcon/article`` (doc.text.fill)
/// - Color: ``DocumentationColor/article`` (green)
/// - Shape: ``DocumentationShape/article`` (circle)
///
/// ## Example
///
/// ```swift
/// let article = ArticleModel(
///     title: "What's New in Swift 6",
///     body: "Swift 6 introduces exciting new features...",
///     author: "Swift Team",
///     tags: ["swift", "updates", "language"]
/// )
/// ```
@Model
public final class ArticleModel {
    /// Unique identifier for the article.
    public var id: UUID
    
    /// The title of the article.
    public var title: String
    
    /// The main body content of the article (supports Markdown).
    public var body: String
    
    /// Author name or identifier.
    public var author: String
    
    /// When the article was published (nil if draft).
    public var publishedAt: Date?
    
    /// Tags for categorization and search.
    public var tags: [String]
    
    /// Icon identifier for the article.
    public var icon: DocumentationIcon
    
    /// Category for organizing the article.
    public var category: ContentCategory
    
    /// When the article was created.
    public var createdAt: Date
    
    /// When the article was last updated.
    public var updatedAt: Date
    
    /// ID of the user who created the article.
    public var userID: String
    
    /// Whether the article is published and visible.
    public var isPublished: Bool
    
    /// Number of times the article has been viewed.
    public var viewCount: Int
    
    /// The color associated with articles.
    public static let color = DocumentationColor.article
    
    /// The shape associated with articles.
    public static let shape = DocumentationShape.circle
    
    public init(
        id: UUID = UUID(),
        title: String,
        body: String,
        author: String,
        publishedAt: Date? = nil,
        tags: [String] = [],
        icon: DocumentationIcon = .article,
        category: ContentCategory = .fundamentals,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.body = body
        self.author = author
        self.publishedAt = publishedAt
        self.tags = tags
        self.icon = icon
        self.category = category
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
