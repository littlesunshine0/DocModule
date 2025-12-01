import Foundation

/// Describes how to transform user-provided files into structured documentation artifacts.
public struct DocumentationGenerationPlan: Sendable, Identifiable {
    public struct InputFile: Sendable, Identifiable {
        public var id: UUID
        public var path: String
        public var documentationType: DocumentationType
        public var typeHint: String
        public var priority: Int
        public var status: String
        public var badge: String
        public var hooks: [String]
        public var tags: [String]
        public var thumbnail: String
        public var icon: String
        public var sfSymbol: String
        public var fallbackSymbol: String

        public init(
            id: UUID = UUID(),
            path: String,
            documentationType: DocumentationType,
            typeHint: String = "auto-detect",
            priority: Int = 0,
            status: String = "queued",
            badge: String = "pending",
            hooks: [String] = [],
            tags: [String] = [],
            thumbnail: String = "",
            icon: String = "doc.text",
            sfSymbol: String = "doc.text",
            fallbackSymbol: String = "doc"
        ) {
            self.id = id
            self.path = path
            self.documentationType = documentationType
            self.typeHint = typeHint
            self.priority = priority
            self.status = status
            self.badge = badge
            self.hooks = hooks
            self.tags = tags
            self.thumbnail = thumbnail
            self.icon = icon
            self.sfSymbol = sfSymbol
            self.fallbackSymbol = fallbackSymbol
        }
    }

    public struct Step: Sendable, Identifiable {
        public var id: UUID
        public var name: String
        public var action: String
        public var status: String
        public var badge: String
        public var hooks: [String]
        public var inputs: [String]
        public var outputs: [String]
        public var notes: String

        public init(
            id: UUID = UUID(),
            name: String,
            action: String,
            status: String = "pending",
            badge: String = "automated",
            hooks: [String] = [],
            inputs: [String] = [],
            outputs: [String] = [],
            notes: String = ""
        ) {
            self.id = id
            self.name = name
            self.action = action
            self.status = status
            self.badge = badge
            self.hooks = hooks
            self.inputs = inputs
            self.outputs = outputs
            self.notes = notes
        }
    }

    public var id: UUID
    public var name: String
    public var intent: String
    public var category: String
    public var status: String
    public var badge: String
    public var priority: Int
    public var inputs: [InputFile]
    public var steps: [Step]
    public var workflow: String
    public var templateHints: [String]
    public var outputs: [String]
    public var hooks: [String]
    public var notes: String

    public init(
        id: UUID = UUID(),
        name: String,
        intent: String,
        category: String = "documentation",
        status: String = "draft",
        badge: String = "auto",
        priority: Int = 0,
        inputs: [InputFile] = [],
        steps: [Step] = [],
        workflow: String = "documentation://generate",
        templateHints: [String] = [],
        outputs: [String] = [],
        hooks: [String] = [],
        notes: String = ""
    ) {
        self.id = id
        self.name = name
        self.intent = intent
        self.category = category
        self.status = status
        self.badge = badge
        self.priority = priority
        self.inputs = inputs
        self.steps = steps
        self.workflow = workflow
        self.templateHints = templateHints
        self.outputs = outputs
        self.hooks = hooks
        self.notes = notes
    }
}

public extension DocumentationGenerationPlan {
    /// Provides a default generation flow that can be used to bootstrap automation for user files.
    static func defaultPlan(for files: [InputFile]) -> DocumentationGenerationPlan {
        let parseStep = Step(
            name: "Parse Files",
            action: "Tokenize and extract structure from input files",
            status: "pending",
            badge: "ingest",
            hooks: ["beforeParse", "afterParse"],
            inputs: files.map { $0.path },
            outputs: ["parsed-structures.json"],
            notes: "Leverages type hints and documentation taxonomy for classification"
        )

        let classifyStep = Step(
            name: "Classify Content",
            action: "Map parsed content to DocumentationType and template hints",
            status: "pending",
            badge: "analyze",
            hooks: ["beforeClassify", "afterClassify"],
            inputs: ["parsed-structures.json"],
            outputs: ["classification-report.json", "template-suggestions.json"],
            notes: "Uses taxonomy labels to route files to the correct generator"
        )

        let renderStep = Step(
            name: "Render Documentation",
            action: "Apply templates and render Markdown/HTML outputs",
            status: "pending",
            badge: "generate",
            hooks: ["beforeRender", "afterRender", "onRenderError"],
            inputs: ["classification-report.json", "template-suggestions.json"],
            outputs: ["generated-docs/"],
            notes: "Attaches thumbnails, icons, and SF Symbol fallbacks into headers"
        )

        let publishStep = Step(
            name: "Publish Artifacts",
            action: "Send generated docs to repository, docs site, and notifications",
            status: "pending",
            badge: "deploy",
            hooks: ["beforePublish", "afterPublish"],
            inputs: ["generated-docs/"],
            outputs: ["docs-site", "pdf-export", "in-product-help"],
            notes: "Integrates with workflow outputs and automation hooks"
        )

        return DocumentationGenerationPlan(
            name: "Automated Documentation from User Files",
            intent: "Transform user-provided files into fully templated documentation",
            category: "knowledge-automation",
            status: "ready",
            badge: "default",
            priority: 1,
            inputs: files,
            steps: [parseStep, classifyStep, renderStep, publishStep],
            workflow: "documentation://generate",
            templateHints: Array(Set(files.map { $0.documentationType.rawValue })),
            outputs: ["generated-docs/", "reporting/automation-summary.md"],
            hooks: ["onPlanStart", "onPlanComplete", "onPlanFailure"],
            notes: "Starter plan combining ingestion, classification, rendering, and publishing."
        )
    }
}
