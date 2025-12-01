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
        }
    }
}
