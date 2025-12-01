import Foundation

/// Colors associated with each documentation content type.
public enum DocumentationColor: String, Codable, Sendable, CaseIterable {
    case guide = "blue"
    case article = "green"
    case tutorial = "orange"
    case reference = "purple"
    case changelog = "indigo"
    case faq = "teal"
    case glossary = "brown"
    case snippet = "cyan"
    case diagram = "pink"
    case video = "red"
    case sample = "mint"
    case troubleshooting = "yellow"
    case caseStudy = "navy"
    case whitepaper = "plum"
    case integration = "turquoise"
    case roadmap = "orchid"
    case useCase = "coral"
    case playbook = "steel"
    case policy = "maroon"
    case readme = "slate"
    case requirements = "copper"
    case tasks = "amber"
    case design = "magenta"
    case blueprint = "azure"
    case guides = "lavender"
    case framework = "forest"
    case research = "mulberry"
    
    /// Hex color value for use in custom rendering.
    public var hexValue: String {
        switch self {
        case .guide: return "#007AFF"
        case .article: return "#34C759"
        case .tutorial: return "#FF9500"
        case .reference: return "#AF52DE"
        case .changelog: return "#5856D6"
        case .faq: return "#5AC8FA"
        case .glossary: return "#A2845E"
        case .snippet: return "#32ADE6"
        case .diagram: return "#FF2D55"
        case .video: return "#FF3B30"
        case .sample: return "#00C7BE"
        case .troubleshooting: return "#FFCC00"
        case .caseStudy: return "#1D3A5F"
        case .whitepaper: return "#9B59B6"
        case .integration: return "#1ABC9C"
        case .roadmap: return "#DA70D6"
        case .useCase: return "#FF7F50"
        case .playbook: return "#708090"
        case .policy: return "#800000"
        case .readme: return "#708090"
        case .requirements: return "#B87333"
        case .tasks: return "#FFC107"
        case .design: return "#FF00FF"
        case .blueprint: return "#007FFF"
        case .guides: return "#E6E6FA"
        case .framework: return "#228B22"
        case .research: return "#8B008B"
        }
    }
    
    /// RGB components (0-1 range) for the color.
    public var rgbComponents: (red: Double, green: Double, blue: Double) {
        switch self {
        case .guide: return (0.0, 0.478, 1.0)
        case .article: return (0.204, 0.780, 0.349)
        case .tutorial: return (1.0, 0.584, 0.0)
        case .reference: return (0.686, 0.322, 0.871)
        case .changelog: return (0.345, 0.337, 0.839)
        case .faq: return (0.353, 0.784, 0.980)
        case .glossary: return (0.635, 0.518, 0.369)
        case .snippet: return (0.196, 0.678, 0.902)
        case .diagram: return (1.0, 0.176, 0.333)
        case .video: return (1.0, 0.231, 0.188)
        case .sample: return (0.0, 0.780, 0.745)
        case .troubleshooting: return (1.0, 0.8, 0.0)
        case .caseStudy: return (0.114, 0.227, 0.373)
        case .whitepaper: return (0.608, 0.349, 0.714)
        case .integration: return (0.102, 0.737, 0.612)
        case .roadmap: return (0.855, 0.439, 0.839)
        case .useCase: return (1.0, 0.498, 0.314)
        case .playbook: return (0.439, 0.502, 0.569)
        case .policy: return (0.502, 0.0, 0.0)
        case .readme: return (0.439, 0.502, 0.569)
        case .requirements: return (0.722, 0.451, 0.2)
        case .tasks: return (1.0, 0.757, 0.027)
        case .design: return (1.0, 0.0, 1.0)
        case .blueprint: return (0.0, 0.498, 1.0)
        case .guides: return (0.902, 0.902, 0.980)
        case .framework: return (0.133, 0.545, 0.133)
        case .research: return (0.545, 0.0, 0.545)
        }
    }
}
