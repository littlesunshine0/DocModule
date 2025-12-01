import Foundation
import SwiftData

/// A step within a guide, containing instructions and optional media.
///
/// Guide steps provide structured, sequential instructions for completing tasks.
///
/// ## Example
///
/// ```swift
/// let step = GuideStep(
///     title: "Install Dependencies",
///     content: "Run npm install to install all required packages.",
///     order: 1
/// )
/// ```
public struct GuideStep: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var content: String
    public var order: Int
    public var imageURL: String?
    public var codeSnippet: String?
    
    public init(
        id: UUID = UUID(),
        title: String,
        content: String,
        order: Int,
        imageURL: String? = nil,
        codeSnippet: String? = nil
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.order = order
        self.imageURL = imageURL
        self.codeSnippet = codeSnippet
    }
}

/// A SwiftData model representing a step-by-step guide.
///
/// Guides provide structured, sequential content for learning specific topics
/// or completing tasks. Each guide contains multiple steps and supports
/// categorization and publishing workflows.
///
/// ## Overview
///
/// GuideModel is designed for content that walks users through a process
/// in a specific order. Use guides for:
/// - Installation instructions
/// - Configuration walkthroughs
/// - Multi-step procedures
///
/// ## Visual Identity
///
/// - Icon: ``DocumentationIcon/guide`` (book.fill)
/// - Color: ``DocumentationColor/guide`` (blue)
/// - Shape: ``DocumentationShape/guide`` (rounded rectangle)
///
/// ## Example
///
/// ```swift
/// let guide = GuideModel(
///     title: "Setting Up Your Project",
///     content: "Learn how to configure your development environment.",
///     category: .gettingStarted,
///     author: "Documentation Team"
/// )
/// guide.steps = [
///     GuideStep(title: "Step 1", content: "Install Xcode", order: 1)
/// ]
/// ```
@Model
public final class GuideModel {
    /// Unique identifier for the guide.
    public var id: UUID
    
    /// The title of the guide.
    public var title: String
    
    /// Overview content describing what the guide covers.
    public var content: String
    
    /// Category for organizing the guide.
    public var category: ContentCategory
    
    /// JSON-encoded array of guide steps.
    public var stepsData: Data
    
    /// IDs of related content items.
    public var relatedContentIDs: [UUID]
    
    /// Icon identifier for the guide.
    public var icon: DocumentationIcon
    
    /// Author name or identifier.
    public var author: String
    
    /// When the guide was created.
    public var createdAt: Date
    
    /// When the guide was last updated.
    public var updatedAt: Date
    
    /// ID of the user who created the guide.
    public var userID: String
    
    /// Whether the guide is published and visible.
    public var isPublished: Bool
    
    /// Number of times the guide has been viewed.
    public var viewCount: Int
    
    /// The color associated with guides.
    public static let color = DocumentationColor.guide
    
    /// The shape associated with guides.
    public static let shape = DocumentationShape.roundedRectangle
    
    /// Decoded steps from stepsData.
    public var steps: [GuideStep] {
        get {
            (try? JSONDecoder().decode([GuideStep].self, from: stepsData)) ?? []
        }
        set {
            stepsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        content: String,
        category: ContentCategory = .fundamentals,
        steps: [GuideStep] = [],
        relatedContentIDs: [UUID] = [],
        icon: DocumentationIcon = .guide,
        author: String,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.category = category
        self.stepsData = (try? JSONEncoder().encode(steps)) ?? Data()
        self.relatedContentIDs = relatedContentIDs
        self.icon = icon
        self.author = author
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
