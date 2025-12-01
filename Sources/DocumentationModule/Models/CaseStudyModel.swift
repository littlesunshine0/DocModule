import Foundation
import SwiftData

/// A SwiftData model representing a customer or product case study.
///
/// Case studies showcase real-world scenarios, highlighting the problem,
/// the solution, and measurable results. They help readers understand how
/// the product performs in practice.
///
/// ## Example
/// ```swift
/// let caseStudy = CaseStudyModel(
///     title: "Scaling Checkout",
///     summary: "How ACME grew conversions by 18% with async APIs",
///     industry: "E-commerce",
///     problemStatement: "Slow checkout flow",
///     solution: "Adopted async payment API",
///     results: ["conversionIncrease": 18.0],
///     author: "Developer Success"
/// )
/// ```
@Model
public final class CaseStudyModel {
    /// Unique identifier for the case study.
    public var id: UUID

    /// Title of the case study.
    public var title: String

    /// Short summary describing the scenario.
    public var summary: String

    /// The industry or vertical the case study belongs to.
    public var industry: String

    /// Description of the challenge or pain point.
    public var problemStatement: String

    /// Description of the solution that was implemented.
    public var solution: String

    /// Key measured results, such as percentage improvements.
    public var results: [String: Double]

    /// Qualitative testimonials or quotes.
    public var testimonials: [String]

    /// Tags for search and discovery.
    public var tags: [String]

    /// Recommended content category.
    public var category: ContentCategory

    /// Author or owner of the case study.
    public var author: String

    /// When the case study was published.
    public var publishedAt: Date?

    /// Tracking for reads.
    public var viewCount: Int

    /// When the case study was created.
    public var createdAt: Date

    /// When the case study was last updated.
    public var updatedAt: Date

    /// Icon associated with case studies.
    public var icon: DocumentationIcon

    /// The color associated with case studies.
    public static let color = DocumentationColor.caseStudy

    /// The shape associated with case studies.
    public static let shape = DocumentationShape.shield

    public init(
        id: UUID = UUID(),
        title: String,
        summary: String,
        industry: String,
        problemStatement: String,
        solution: String,
        results: [String: Double] = [:],
        testimonials: [String] = [],
        tags: [String] = [],
        category: ContentCategory = .bestPractices,
        author: String,
        publishedAt: Date? = nil,
        viewCount: Int = 0,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        icon: DocumentationIcon = .caseStudy
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.industry = industry
        self.problemStatement = problemStatement
        self.solution = solution
        self.results = results
        self.testimonials = testimonials
        self.tags = tags
        self.category = category
        self.author = author
        self.publishedAt = publishedAt
        self.viewCount = viewCount
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.icon = icon
    }
}
