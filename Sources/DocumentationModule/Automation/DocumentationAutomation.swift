import Foundation

/// Defines the automation submodules that orchestrate documentation creation and delivery.
public struct DocumentationAutomation: Sendable {
    /// Descriptor capturing visual identity, taxonomy, and behavior for a submodule.
    public struct Submodule: Identifiable, Sendable {
        public var id: UUID
        public var name: String
        public var type: String
        public var kind: String
        public var category: String
        public var status: String
        public var badge: String
        public var priority: Int
        public var color: DocumentationColor
        public var shape: String
        public var icon: String
        public var sfSymbol: String
        public var fallbackSymbol: String
        public var hooks: [String]
        public var responsibilities: [String]
        public var capabilities: [String]
        public var entrypoints: [String]
        public var outputs: [String]
        public var notes: String

        public init(
            id: UUID = UUID(),
            name: String,
            type: String,
            kind: String,
            category: String,
            status: String = "active",
            badge: String = "ready",
            priority: Int = 0,
            color: DocumentationColor,
            shape: String,
            icon: String,
            sfSymbol: String,
            fallbackSymbol: String,
            hooks: [String] = [],
            responsibilities: [String] = [],
            capabilities: [String] = [],
            entrypoints: [String] = [],
            outputs: [String] = [],
            notes: String = ""
        ) {
            self.id = id
            self.name = name
            self.type = type
            self.kind = kind
            self.category = category
            self.status = status
            self.badge = badge
            self.priority = priority
            self.color = color
            self.shape = shape
            self.icon = icon
            self.sfSymbol = sfSymbol
            self.fallbackSymbol = fallbackSymbol
            self.hooks = hooks
            self.responsibilities = responsibilities
            self.capabilities = capabilities
            self.entrypoints = entrypoints
            self.outputs = outputs
            self.notes = notes
        }
    }

    public static let submodules: [Submodule] = [
        Submodule(
            name: "Documentation Automation",
            type: "automation",
            kind: "system",
            category: "orchestration",
            status: "online",
            badge: "core",
            priority: 1,
            color: .framework,
            shape: "hexagon",
            icon: "gearshape.2",
            sfSymbol: "gearshape.2",
            fallbackSymbol: "gearshape",
            hooks: ["onInit", "onFailure", "onRecovery"],
            responsibilities: [
                "Owns overall documentation automation posture",
                "Routes artifacts between parser, generator, and deployer",
                "Maintains safety rails and guardrails across workflows"
            ],
            capabilities: [
                "Centralized configuration",
                "Observability and telemetry fan-out",
                "Blueprint-aware orchestration"
            ],
            entrypoints: ["automation://bootstrap", "automation://configure"],
            outputs: ["automation-report.json", "automation-metrics.json"],
            notes: "Acts as the umbrella orchestrator for all automation submodules."
        ),
        Submodule(
            name: "Documentation Tasks",
            type: "tasking",
            kind: "queue",
            category: "execution",
            status: "active",
            badge: "asynchronous",
            priority: 2,
            color: .tasks,
            shape: "roundedRectangle",
            icon: "checklist",
            sfSymbol: "checklist",
            fallbackSymbol: "list.bullet",
            hooks: ["beforeTask", "afterTask", "onTaskFailure"],
            responsibilities: [
                "Models discrete automation tasks such as parse, lint, and render",
                "Tracks lifecycle and status for each queued operation",
                "Provides prioritization hints to the workflow engine"
            ],
            capabilities: [
                "Task scheduling",
                "Progress aggregation",
                "Back-pressure aware dispatch"
            ],
            entrypoints: ["tasks://enqueue", "tasks://inspect"],
            outputs: ["task-ledger.json", "task-summary.md"],
            notes: "Supplies structured task metadata consumed by workflows and agents."
        ),
        Submodule(
            name: "Documentation Agent",
            type: "agent",
            kind: "copilot",
            category: "assistance",
            status: "available",
            badge: "interactive",
            priority: 3,
            color: .guide,
            shape: "capsule",
            icon: "sparkles",
            sfSymbol: "sparkles",
            fallbackSymbol: "wand.and.stars",
            hooks: ["onSuggestion", "onFeedback", "onEscalation"],
            responsibilities: [
                "Guides authors through automation-ready documentation flows",
                "Surfaces suggested commands and workflows based on context",
                "Escalates to human review when guardrails are triggered"
            ],
            capabilities: [
                "Contextual recommendations",
                "Validation hints",
                "Adaptive prompts aligned to taxonomy"
            ],
            entrypoints: ["agent://assist", "agent://triage"],
            outputs: ["agent-recommendations.md", "agent-feedback.json"],
            notes: "Pairs with commands and workflows to streamline authoring."
        ),
        Submodule(
            name: "Documentation Commands",
            type: "command-center",
            kind: "actions",
            category: "control",
            status: "stable",
            badge: "cli + ui",
            priority: 4,
            color: .reference,
            shape: "circle",
            icon: "rectangle.and.hand.point.up.left",
            sfSymbol: "rectangle.and.hand.point.up.left",
            fallbackSymbol: "keyboard",
            hooks: ["beforeCommand", "afterCommand", "onUndo", "onRedo"],
            responsibilities: [
                "Provides command catalog for automation-aware tooling",
                "Links command categories to tasks and workflows",
                "Propagates visual identity (icons, shapes, badges) to UI surfaces"
            ],
            capabilities: [
                "Keyboard shortcut mapping",
                "Command palette metadata",
                "Action dispatcher compatibility"
            ],
            entrypoints: ["commands://palette", "commands://shortcut"],
            outputs: ["command-log.ndjson", "command-telemetry.json"],
            notes: "Wraps ``DocumentationCommand`` to expose automation-ready descriptors."
        ),
        Submodule(
            name: "Documentation Workflow",
            type: "workflow",
            kind: "pipeline",
            category: "orchestration",
            status: "ready",
            badge: "async",
            priority: 5,
            color: .blueprint,
            shape: "diamond",
            icon: "arrow.triangle.2.circlepath",
            sfSymbol: "arrow.triangle.2.circlepath",
            fallbackSymbol: "arrow.clockwise.circle",
            hooks: ["beforeStep", "afterStep", "onStepFailure", "onNotification"],
            responsibilities: [
                "Sequences tasks with configurable triggers and conditions",
                "Captures timing, outputs, and errors per step",
                "Publishes completion events for downstream systems"
            ],
            capabilities: [
                "Trigger-aware execution",
                "Continuation control",
                "Result aggregation"
            ],
            entrypoints: ["workflow://execute", "workflow://preview"],
            outputs: ["workflow-run.json", "workflow-report.md"],
            notes: "Backed by ``DocumentationWorkflow`` and its step configs."
        ),
        Submodule(
            name: "Documentation Template",
            type: "template",
            kind: "library",
            category: "composition",
            status: "ready",
            badge: "reusable",
            priority: 6,
            color: .blueprint,
            shape: "rectangle",
            icon: "square.stack.3d.forward.dottedline",
            sfSymbol: "square.stack.3d.forward.dottedline",
            fallbackSymbol: "doc.on.doc",
            hooks: ["beforeApply", "afterApply", "onTemplateUpgrade"],
            responsibilities: [
                "Stores starter layouts and content blueprints for every documentation type",
                "Tracks versioned templates with migration notes and compatibility cues",
                "Publishes template metadata for command palette and workflow selection"
            ],
            capabilities: [
                "Slot-based placeholder rendering",
                "Guardrails for required sections",
                "Thumbnail + icon propagation into generated docs"
            ],
            entrypoints: ["template://catalog", "template://apply"],
            outputs: ["template-manifest.json", "applied-template.md"],
            notes: "Central registry for doc-ready templates shared across automation layers."
        ),
        Submodule(
            name: "Documentation Roles",
            type: "role-management",
            kind: "governance",
            category: "access",
            status: "available",
            badge: "RBAC",
            priority: 7,
            color: .manager,
            shape: "capsule",
            icon: "person.3.sequence",
            sfSymbol: "person.3.sequence",
            fallbackSymbol: "person.3.fill",
            hooks: ["beforeAssignment", "afterAssignment", "onEscalation"],
            responsibilities: [
                "Defines author, reviewer, and approver roles for each documentation type",
                "Attaches ownership, domain, and escalation paths to automation tasks",
                "Syncs roster changes with workflow gates and command permissions"
            ],
            capabilities: [
                "Role templates per taxonomy category",
                "Escalation routing with fallback assignees",
                "Audit annotations for changes"
            ],
            entrypoints: ["roles://assign", "roles://resolve"],
            outputs: ["role-matrix.json", "role-changelog.md"],
            notes: "Keeps automation aligned with human responsibilities and ownership maps."
        ),
        Submodule(
            name: "Documentation Permissions",
            type: "authorization",
            kind: "policy",
            category: "access",
            status: "enforced",
            badge: "ACL",
            priority: 8,
            color: .policy,
            shape: "shield",
            icon: "lock.shield",
            sfSymbol: "lock.shield",
            fallbackSymbol: "lock",
            hooks: ["beforeAccess", "afterAccess", "onDenied"],
            responsibilities: [
                "Applies permissions to commands, tasks, and workflow steps",
                "Manages read/write/publish scopes per documentation category",
                "Logs enforcement outcomes for observability and audits"
            ],
            capabilities: [
                "Fine-grained ACLs with taxonomy filters",
                "Temporary overrides with expiration",
                "Policy bundles for common automation flows"
            ],
            entrypoints: ["permissions://check", "permissions://grant"],
            outputs: ["permission-log.ndjson", "acl-policy.json"],
            notes: "Ensures automation actions stay within approved access boundaries."
        ),
        Submodule(
            name: "Documentation Security",
            type: "security",
            kind: "trust",
            category: "protection",
            status: "online",
            badge: "guardrails",
            priority: 9,
            color: .research,
            shape: "octagon",
            icon: "shield.lefthalf.filled",
            sfSymbol: "shield.lefthalf.filled",
            fallbackSymbol: "exclamationmark.shield",
            hooks: ["beforeSensitiveAction", "afterSensitiveAction", "onIncident"],
            responsibilities: [
                "Runs safety checks on generated content, commands, and workflows",
                "Monitors secrets exposure, PII handling, and compliance flags",
                "Provides remediation guidance and auto-redaction hooks"
            ],
            capabilities: [
                "Policy-driven scanning",
                "Incident tagging with severity badges",
                "Security event exports for SIEM pipelines"
            ],
            entrypoints: ["security://scan", "security://review"],
            outputs: ["security-report.md", "security-events.ndjson"],
            notes: "Injects guardrails into every automation stage with actionable findings."
        ),
        Submodule(
            name: "Generation Service",
            type: "service",
            kind: "generator",
            category: "rendering",
            status: "online",
            badge: "engine",
            priority: 10,
            color: .service,
            shape: "hexagon",
            icon: "cpu",
            sfSymbol: "cpu",
            fallbackSymbol: "sparkle.magnifyingglass",
            hooks: ["beforeGenerate", "afterGenerate", "onGenerateError"],
            responsibilities: [
                "Transforms parsed structures and templates into finalized documentation artifacts",
                "Applies thumbnails, icons, and fallback SF Symbols to rendered outputs",
                "Optimizes rendering for HTML, DocC, PDF, and in-product help surfaces"
            ],
            capabilities: [
                "Parallel render passes",
                "Template slot hydration with taxonomy awareness",
                "Artifact integrity and completeness checks"
            ],
            entrypoints: ["generation://render", "generation://preview"],
            outputs: ["render-report.json", "generated-documents/"],
            notes: "Primary rendering engine for automation plans and workflows."
        ),
        Submodule(
            name: "Tagging Service",
            type: "service",
            kind: "classifier",
            category: "metadata",
            status: "active",
            badge: "taxonomy",
            priority: 11,
            color: .reference,
            shape: "roundedRectangle",
            icon: "tag", 
            sfSymbol: "tag",
            fallbackSymbol: "number",
            hooks: ["beforeTag", "afterTag", "onRetag"],
            responsibilities: [
                "Classifies content into DocumentationType and taxonomy kind/category",
                "Assigns priorities, statuses, and badges for automation routing",
                "Publishes tagging metadata to workflows, commands, and agents"
            ],
            capabilities: [
                "Rule-based and semantic tagging",
                "Conflict detection with human-in-the-loop overrides",
                "Bulk retagging for repository migrations"
            ],
            entrypoints: ["tagging://classify", "tagging://review"],
            outputs: ["tag-ledger.json", "taxonomy-report.md"],
            notes: "Keeps documentation consistently organized for downstream automation."
        ),
        Submodule(
            name: "Real-World Service",
            type: "service",
            kind: "evidence",
            category: "validation",
            status: "pilot",
            badge: "evidence",
            priority: 12,
            color: .caseStudy,
            shape: "diamond",
            icon: "globe.europe.africa",
            sfSymbol: "globe.europe.africa",
            fallbackSymbol: "globe",
            hooks: ["beforeValidation", "afterValidation", "onSignal"],
            responsibilities: [
                "Ingests real-world signals such as logs, metrics, and user feedback",
                "Maps evidence to documentation updates, FAQs, and troubleshooting sections",
                "Surfaces confidence badges, status, and priority based on impact"
            ],
            capabilities: [
                "Signal-to-doc mapping",
                "Evidence provenance tracking",
                "Feedback loops into templates and workflows"
            ],
            entrypoints: ["realworld://ingest", "realworld://evidence"],
            outputs: ["evidence-report.json", "realworld-changelog.md"],
            notes: "Keeps documentation grounded in production data and customer feedback."
        ),
        Submodule(
            name: "Indexing Service",
            type: "service",
            kind: "search",
            category: "discovery",
            status: "active",
            badge: "search",
            priority: 13,
            color: .guide,
            shape: "circle",
            icon: "magnifyingglass.circle",
            sfSymbol: "magnifyingglass.circle",
            fallbackSymbol: "magnifyingglass",
            hooks: ["beforeIndex", "afterIndex", "onReindex"],
            responsibilities: [
                "Indexes generated documents with taxonomy, status, and badge metadata",
                "Exposes search and retrieval endpoints for commands and agents",
                "Coordinates incremental and full reindex operations"
            ],
            capabilities: [
                "Fielded search with facets",
                "Index compaction and health monitoring",
                "Embeddings-aware retrieval integration"
            ],
            entrypoints: ["index://build", "index://search"],
            outputs: ["index-state.json", "index-metrics.ndjson"],
            notes: "Ensures documentation is discoverable across automation surfaces."
        ),
        Submodule(
            name: "Export Service",
            type: "service",
            kind: "distribution",
            category: "publishing",
            status: "online",
            badge: "export",
            priority: 14,
            color: .blueprint,
            shape: "rectangle",
            icon: "square.and.arrow.up.on.square",
            sfSymbol: "square.and.arrow.up.on.square",
            fallbackSymbol: "square.and.arrow.up",
            hooks: ["beforeExport", "afterExport", "onExportFailure"],
            responsibilities: [
                "Packages documentation into HTML, PDF, DocC, and site bundles",
                "Applies platform-specific branding, shapes, and icons to exports",
                "Delivers exports to portals, CDNs, and artifact stores"
            ],
            capabilities: [
                "Multi-channel publishing",
                "Checksum and signature verification",
                "Export profile presets with configurable badges"
            ],
            entrypoints: ["export://bundle", "export://publish"],
            outputs: ["exports/", "export-report.md"],
            notes: "Handles outward distribution for generated documentation artifacts."
        ),
        Submodule(
            name: "Import Service",
            type: "service",
            kind: "ingest",
            category: "acquisition",
            status: "ready",
            badge: "ingest",
            priority: 15,
            color: .integration,
            shape: "roundedSquare",
            icon: "tray.and.arrow.down.fill",
            sfSymbol: "tray.and.arrow.down.fill",
            fallbackSymbol: "arrow.down.doc",
            hooks: ["beforeImport", "afterImport", "onImportError"],
            responsibilities: [
                "Brings external documents, specs, and user files into the automation pipeline",
                "Normalizes formats and enriches with thumbnails, icons, and taxonomy",
                "Triggers downstream tagging, generation, and indexing steps"
            ],
            capabilities: [
                "Format normalization",
                "Duplicate detection",
                "Bulk import with resumable checkpoints"
            ],
            entrypoints: ["import://ingest", "import://normalize"],
            outputs: ["import-log.ndjson", "normalized-assets/"],
            notes: "Front door for external assets feeding automation workflows."
        ),
        Submodule(
            name: "Config Service",
            type: "service",
            kind: "configuration",
            category: "control",
            status: "online",
            badge: "settings",
            priority: 16,
            color: .manager,
            shape: "capsule",
            icon: "slider.horizontal.3",
            sfSymbol: "slider.horizontal.3",
            fallbackSymbol: "gearshape",
            hooks: ["beforeConfig", "afterConfig", "onConfigChange"],
            responsibilities: [
                "Centralizes automation presets for templates, workflows, and services",
                "Manages environment-specific overrides and secrets handoff",
                "Publishes configuration snapshots with status and badge metadata"
            ],
            capabilities: [
                "Versioned configuration sets",
                "Drift detection and rollback",
                "Scoped configuration by taxonomy"
            ],
            entrypoints: ["config://get", "config://apply"],
            outputs: ["config-snapshots/", "config-report.json"],
            notes: "Provides a single source of truth for automation tuning."
        ),
        Submodule(
            name: "Gateway Service",
            type: "service",
            kind: "edge",
            category: "access",
            status: "active",
            badge: "api",
            priority: 17,
            color: .roadmap,
            shape: "triangle",
            icon: "network",
            sfSymbol: "network",
            fallbackSymbol: "point.topleft.down.curvedto.point.bottomright.up",
            hooks: ["beforeRequest", "afterRequest", "onThrottle"],
            responsibilities: [
                "Fronts automation APIs for commands, agents, and external callers",
                "Enforces permissions, quotas, and status-aware routing",
                "Broadcasts events and badges about gateway health and policy outcomes"
            ],
            capabilities: [
                "Rate limiting and throttling",
                "Protocol translation for CLI/UI/CI callers",
                "Gateway telemetry and audit headers"
            ],
            entrypoints: ["gateway://invoke", "gateway://health"],
            outputs: ["gateway-metrics.ndjson", "gateway-audit.log"],
            notes: "Secure ingress for automation consumers with observability built-in."
        )
    ]
}

public extension DocumentationAutomation.Submodule {
    /// Human-readable label combining key taxonomy signals.
    var taxonomyLabel: String {
        "\(category.capitalized) / \(kind.capitalized) / \(type.capitalized)"
    }
}
