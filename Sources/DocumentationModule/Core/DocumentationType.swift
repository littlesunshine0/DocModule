import Foundation

/// All supported documentation content types.
///
/// Each type has associated visual identity, structure, and workflow capabilities.
public enum DocumentationType: String, Codable, Sendable, CaseIterable {
    case guide
    case article
    case tutorial
    case reference
    case changelog
    case faq
    case glossary
    case snippet
    case diagram
    case video
    case sample
    case troubleshooting
    
    /// The icon for this documentation type.
    public var icon: DocumentationIcon {
        switch self {
        case .guide: return .guide
        case .article: return .article
        case .tutorial: return .tutorial
        case .reference: return .reference
        case .changelog: return .changelog
        case .faq: return .faq
        case .glossary: return .glossary
        case .snippet: return .snippet
        case .diagram: return .diagram
        case .video: return .video
        case .sample: return .sample
        case .troubleshooting: return .troubleshooting
        }
    }
    
    /// The color for this documentation type.
    public var color: DocumentationColor {
        switch self {
        case .guide: return .guide
        case .article: return .article
        case .tutorial: return .tutorial
        case .reference: return .reference
        case .changelog: return .changelog
        case .faq: return .faq
        case .glossary: return .glossary
        case .snippet: return .snippet
        case .diagram: return .diagram
        case .video: return .video
        case .sample: return .sample
        case .troubleshooting: return .troubleshooting
        }
    }
    
    /// The shape for this documentation type.
    public var shape: DocumentationShape {
        switch self {
        case .guide: return .roundedRectangle
        case .article: return .circle
        case .tutorial: return .hexagon
        case .reference: return .square
        case .changelog: return .diamond
        case .faq: return .capsule
        case .glossary: return .rectangle
        case .snippet: return .roundedSquare
        case .diagram: return .octagon
        case .video: return .stadium
        case .sample: return .pentagon
        case .troubleshooting: return .triangle
        }
    }
    
    /// Human-readable display name.
    public var displayName: String {
        switch self {
        case .guide: return "Guide"
        case .article: return "Article"
        case .tutorial: return "Tutorial"
        case .reference: return "Reference"
        case .changelog: return "Changelog"
        case .faq: return "FAQ"
        case .glossary: return "Glossary"
        case .snippet: return "Code Snippet"
        case .diagram: return "Diagram"
        case .video: return "Video"
        case .sample: return "Sample Project"
        case .troubleshooting: return "Troubleshooting"
        }
    }
    
    /// Description of this documentation type.
    public var description: String {
        switch self {
        case .guide: return "Step-by-step instructions for completing tasks"
        case .article: return "Long-form written content and explanations"
        case .tutorial: return "Interactive hands-on learning experiences"
        case .reference: return "Technical API and type documentation"
        case .changelog: return "Version history and release notes"
        case .faq: return "Frequently asked questions and answers"
        case .glossary: return "Definitions of terms and concepts"
        case .snippet: return "Reusable code examples"
        case .diagram: return "Visual representations and flowcharts"
        case .video: return "Video tutorials and demonstrations"
        case .sample: return "Complete sample projects"
        case .troubleshooting: return "Problem-solution guides"
        }
    }
}
