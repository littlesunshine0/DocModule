import Foundation
import SwiftData

/// A SwiftData model representing an in-depth whitepaper.
///
/// Whitepapers provide authoritative, research-backed explanations of
/// complex topics. They often include citations, data sets, and versioned
/// releases.
///
/// ## Example
/// ```swift
/// let whitepaper = WhitepaperModel(
///     title: "Modern Concurrency",
///     abstract: "An overview of structured concurrency in Swift",
///     body: "This whitepaper explores...",
///     version: "1.0",
///     citations: ["Swift Concurrency Documentation"],
///     datasets: ["concurrency-benchmarks.csv"],
///     author: "Architecture Team"
/// )
/// ```
@Model
public final class WhitepaperModel {
    /// Unique identifier for the whitepaper.
    public var id: UUID

    /// Title of the whitepaper.
    public var title: String

    /// Short abstract summarizing the topic.
    public var abstract: String

    /// Main body content (supports Markdown).
    public var body: String

    /// Version identifier for the whitepaper.
    public var version: String

    /// Date when the whitepaper was published.
    public var publishedAt: Date?

    /// Sources or citations referenced in the paper.
    public var citations: [String]

    /// Links to downloadable datasets.
    public var datasets: [String]

    /// Target audience description.
    public var audience: String

    /// Primary tags for discovery.
    public var tags: [String]

    /// Author or owner of the whitepaper.
    public var author: String

    /// The category the whitepaper belongs to.
    public var category: ContentCategory

    /// Tracking for reads.
    public var viewCount: Int

    /// When the whitepaper was created.
    public var createdAt: Date

    /// When the whitepaper was last updated.
    public var updatedAt: Date

    /// Icon associated with whitepapers.
    public var icon: DocumentationIcon

    /// The color associated with whitepapers.
    public static let color = DocumentationColor.whitepaper

    /// The shape associated with whitepapers.
    public static let shape = DocumentationShape.parallelogram

    public init(
        id: UUID = UUID(),
        title: String,
        abstract: String,
        body: String,
        version: String,
        publishedAt: Date? = nil,
        citations: [String] = [],
        datasets: [String] = [],
        audience: String = "Technical",
        tags: [String] = [],
        author: String,
        category: ContentCategory = .advanced,
        viewCount: Int = 0,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .whitepaper
    ) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.body = body
        self.version = version
        self.publishedAt = publishedAt
        self.citations = citations
        self.datasets = datasets
        self.audience = audience
        self.tags = tags
        self.author = author
        self.category = category
        self.viewCount = viewCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
