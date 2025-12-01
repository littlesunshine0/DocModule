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
        )
    ]
}

public extension DocumentationAutomation.Submodule {
    /// Human-readable label combining key taxonomy signals.
    var taxonomyLabel: String {
        "\(category.capitalized) / \(kind.capitalized) / \(type.capitalized)"
    }
}
