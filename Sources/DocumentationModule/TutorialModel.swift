import Foundation
import SwiftData

/// Difficulty levels for tutorials.
///
/// Helps users find tutorials appropriate for their skill level.
public enum TutorialDifficulty: String, Codable, Sendable, CaseIterable {
    case beginner
    case intermediate
    case advanced
    case expert
    
    /// Human-readable display name.
    public var displayName: String {
        rawValue.capitalized
    }
    
    /// Estimated skill level (1-4).
    public var level: Int {
        switch self {
        case .beginner: return 1
        case .intermediate: return 2
        case .advanced: return 3
        case .expert: return 4
        }
    }
}

/// A step within a tutorial with interactive elements.
public struct TutorialStep: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var title: String
    public var instructions: String
    public var order: Int
    public var codeTemplate: String?
    public var expectedOutput: String?
    public var hints: [String]
    
    public init(
        id: UUID = UUID(),
        title: String,
        instructions: String,
        order: Int,
        codeTemplate: String? = nil,
        expectedOutput: String? = nil,
        hints: [String] = []
    ) {
        self.id = id
        self.title = title
        self.instructions = instructions
        self.order = order
        self.codeTemplate = codeTemplate
        self.expectedOutput = expectedOutput
        self.hints = hints
    }
}

/// A SwiftData model representing an interactive tutorial.
///
/// Tutorials are hands-on learning experiences with difficulty levels,
/// time estimates, and prerequisites. They guide users through building
/// something practical.
///
/// ## Overview
///
/// TutorialModel is designed for interactive, project-based learning.
/// Use tutorials for:
/// - Building sample projects
/// - Learning by doing
/// - Skill-building exercises
/// - Hands-on workshops
///
/// ## Visual Identity
///
/// - Icon: ``DocumentationIcon/tutorial`` (lightbulb.fill)
/// - Color: ``DocumentationColor/tutorial`` (orange)
/// - Shape: ``DocumentationShape/tutorial`` (hexagon)
///
/// ## Example
///
/// ```swift
/// let tutorial = TutorialModel(
///     title: "Build Your First SwiftUI App",
///     difficulty: .beginner,
///     estimatedTime: 30,
///     prerequisites: ["Basic Swift knowledge"]
/// )
/// ```
@Model
public final class TutorialModel {
    /// Unique identifier for the tutorial.
    public var id: UUID
    
    /// The title of the tutorial.
    public var title: String
    
    /// JSON-encoded array of tutorial steps.
    public var stepsData: Data
    
    /// Difficulty level of the tutorial.
    public var difficulty: TutorialDifficulty
    
    /// Estimated completion time in minutes.
    public var estimatedTime: Int
    
    /// Prerequisites needed before starting.
    public var prerequisites: [String]
    
    /// Icon identifier for the tutorial.
    public var icon: DocumentationIcon
    
    /// Category for organizing the tutorial.
    public var category: ContentCategory
    
    /// When the tutorial was created.
    public var createdAt: Date
    
    /// When the tutorial was last updated.
    public var updatedAt: Date
    
    /// ID of the user who created the tutorial.
    public var userID: String
    
    /// Whether the tutorial is published and visible.
    public var isPublished: Bool
    
    /// Number of times the tutorial has been completed.
    public var completionCount: Int
    
    /// The color associated with tutorials.
    public static let color = DocumentationColor.tutorial
    
    /// The shape associated with tutorials.
    public static let shape = DocumentationShape.hexagon
    
    /// Decoded steps from stepsData.
    public var steps: [TutorialStep] {
        get {
            (try? JSONDecoder().decode([TutorialStep].self, from: stepsData)) ?? []
        }
        set {
            stepsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        steps: [TutorialStep] = [],
        difficulty: TutorialDifficulty = .beginner,
        estimatedTime: Int = 30,
        prerequisites: [String] = [],
        icon: DocumentationIcon = .tutorial,
        category: ContentCategory = .fundamentals,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        completionCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.stepsData = (try? JSONEncoder().encode(steps)) ?? Data()
        self.difficulty = difficulty
        self.estimatedTime = estimatedTime
        self.prerequisites = prerequisites
        self.icon = icon
        self.category = category
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.completionCount = completionCount
    }
}
