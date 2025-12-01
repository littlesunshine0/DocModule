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
    case caseStudy
    case whitepaper
    case integration
    case roadmap
    case useCase
    case playbook
    case policy
    case readme
    case requirements
    case tasks
    case design
    case blueprint
    case guides
    case framework
    case research
    
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
        case .caseStudy: return .caseStudy
        case .whitepaper: return .whitepaper
        case .integration: return .integration
        case .roadmap: return .roadmap
        case .useCase: return .useCase
        case .playbook: return .playbook
        case .policy: return .policy
        case .readme: return .readme
        case .requirements: return .requirements
        case .tasks: return .tasks
        case .design: return .design
        case .blueprint: return .blueprint
        case .guides: return .guides
        case .framework: return .framework
        case .research: return .research
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
        case .caseStudy: return .caseStudy
        case .whitepaper: return .whitepaper
        case .integration: return .integration
        case .roadmap: return .roadmap
        case .useCase: return .useCase
        case .playbook: return .playbook
        case .policy: return .policy
        case .readme: return .readme
        case .requirements: return .requirements
        case .tasks: return .tasks
        case .design: return .design
        case .blueprint: return .blueprint
        case .guides: return .guides
        case .framework: return .framework
        case .research: return .research
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
        case .caseStudy: return .shield
        case .whitepaper: return .parallelogram
        case .integration: return .roundedRectangle
        case .roadmap: return .stadium
        case .useCase: return .hexagon
        case .playbook: return .rectangle
        case .policy: return .diamond
        case .readme: return .roundedSquare
        case .requirements: return .square
        case .tasks: return .capsule
        case .design: return .octagon
        case .blueprint: return .triangle
        case .guides: return .pentagon
        case .framework: return .circle
        case .research: return .shield
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
        case .caseStudy: return "Real-world stories with measurable outcomes"
        case .whitepaper: return "Authoritative research and technical analysis"
        case .integration: return "Guides for connecting systems and services"
        case .roadmap: return "Forward-looking plans with milestones and themes"
        case .useCase: return "Specific scenarios that illustrate product value"
        case .playbook: return "Operational procedures and repeatable plays"
        case .policy: return "Standards, rules, and compliance guidelines"
        case .readme: return "Project overviews, setup, and usage instructions"
        case .requirements: return "Functional and non-functional requirements"
        case .tasks: return "Actionable task lists and checklists"
        case .design: return "Design decisions, constraints, and rationale"
        case .blueprint: return "High-level system and architecture blueprints"
        case .guides: return "Curated sets of related guides"
        case .framework: return "Structured methodologies and principles"
        case .research: return "Research notes, experiments, and findings"
        }
    }
}
