import Foundation

/// Categories for organizing documentation content.
///
/// Content can be categorized to help users find relevant documentation
/// based on their needs.
public enum ContentCategory: String, Codable, Sendable, CaseIterable {
    case gettingStarted = "getting-started"
    case fundamentals = "fundamentals"
    case advanced = "advanced"
    case bestPractices = "best-practices"
    case troubleshooting = "troubleshooting"
    case api = "api"
    case samples = "samples"
    case migration = "migration"
    
    /// Human-readable display name for the category.
    public var displayName: String {
        switch self {
        case .gettingStarted: return "Getting Started"
        case .fundamentals: return "Fundamentals"
        case .advanced: return "Advanced"
        case .bestPractices: return "Best Practices"
        case .troubleshooting: return "Troubleshooting"
        case .api: return "API"
        case .samples: return "Samples"
        case .migration: return "Migration"
        }
    }
}
