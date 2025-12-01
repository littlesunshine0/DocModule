import Foundation

/// SF Symbol icons associated with each documentation content type.
///
/// Each documentation model has a designated icon for visual identification
/// in user interfaces.
///
/// ## Usage
///
/// ```swift
/// let icon = DocumentationIcon.guide
/// Image(systemName: icon.systemName)
/// ```
public enum DocumentationIcon: String, Codable, Sendable, CaseIterable {
    case guide = "book.fill"
    case article = "doc.text.fill"
    case tutorial = "lightbulb.fill"
    case reference = "curlybraces"
    case changelog = "clock.arrow.circlepath"
    case faq = "questionmark.circle.fill"
    case glossary = "character.book.closed.fill"
    case snippet = "doc.text.below.ecg"
    case diagram = "flowchart.fill"
    case video = "play.rectangle.fill"
    case sample = "folder.fill.badge.gearshape"
    case troubleshooting = "wrench.and.screwdriver.fill"
    
    /// The SF Symbol system name for this icon.
    public var systemName: String { rawValue }
    
    /// Human-readable display name for the icon.
    public var displayName: String {
        switch self {
        case .guide: return "Guide"
        case .article: return "Article"
        case .tutorial: return "Tutorial"
        case .reference: return "Reference"
        case .changelog: return "Changelog"
        case .faq: return "FAQ"
        case .glossary: return "Glossary"
        case .snippet: return "Snippet"
        case .diagram: return "Diagram"
        case .video: return "Video"
        case .sample: return "Sample"
        case .troubleshooting: return "Troubleshooting"
        }
    }
}
