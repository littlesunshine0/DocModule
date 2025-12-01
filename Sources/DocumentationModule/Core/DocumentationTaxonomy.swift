import Foundation

/// High-level grouping for documentation assets.
///
/// `DocumentationType` values can be organized by the kind of work they
/// represent (instructional, reference, operational, etc.) and by a broader
/// lifecycle category to aid navigation and automation.
public enum DocumentationKind: String, Codable, Sendable, CaseIterable {
    case instructional
    case narrative
    case reference
    case architecture
    case governance
    case operational
    case automation
    case showcase
    case miscellaneous

    /// Human-friendly label for display.
    public var displayName: String {
        switch self {
        case .instructional: return "Instructional"
        case .narrative: return "Narrative"
        case .reference: return "Reference"
        case .architecture: return "Architecture"
        case .governance: return "Governance"
        case .operational: return "Operational"
        case .automation: return "Automation"
        case .showcase: return "Showcase"
        case .miscellaneous: return "Miscellaneous"
        }
    }
}

/// Lifecycle categories that organize documentation by intent and stage.
public enum DocumentationCategory: String, Codable, Sendable, CaseIterable {
    case plan
    case build
    case deliver
    case operate
    case learn
    case govern
    case communicate
    case explore

    /// Human-friendly label for display.
    public var displayName: String {
        switch self {
        case .plan: return "Plan"
        case .build: return "Build"
        case .deliver: return "Deliver"
        case .operate: return "Operate"
        case .learn: return "Learn"
        case .govern: return "Govern"
        case .communicate: return "Communicate"
        case .explore: return "Explore"
        }
    }
}

