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
    case caseStudy = "briefcase.fill"
    case whitepaper = "doc.richtext"
    case integration = "puzzlepiece.extension.fill"
    case roadmap = "map.fill"
    case useCase = "target"
    case playbook = "list.bullet.clipboard.fill"
    case policy = "checkmark.shield.fill"
    case readme = "doc.text.magnifyingglass"
    case requirements = "checklist"
    case tasks = "checklist.checked"
    case design = "paintbrush.pointed.fill"
    case blueprint = "ruler.fill"
    case guides = "books.vertical.fill"
    case framework = "cube.box.fill"
    case research = "doc.text.magnifyingglass"
    
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
        case .caseStudy: return "Case Study"
        case .whitepaper: return "Whitepaper"
        case .integration: return "Integration"
        case .roadmap: return "Roadmap"
        case .useCase: return "Use Case"
        case .playbook: return "Playbook"
        case .policy: return "Policy"
        case .readme: return "README"
        case .requirements: return "Requirements"
        case .tasks: return "Tasks"
        case .design: return "Design"
        case .blueprint: return "Blueprint"
        case .guides: return "Guides"
        case .framework: return "Framework"
        case .research: return "Research"
        }
    }
}
