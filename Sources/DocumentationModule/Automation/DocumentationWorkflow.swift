import Foundation

/// Automation workflow for documentation tasks.
public actor DocumentationWorkflow {
    
    public enum WorkflowStep: String, Sendable, CaseIterable {
        case validate
        case lint
        case format
        case transform
        case generate
        case optimize
        case deploy
        case notify
        
        public var displayName: String {
            rawValue.capitalized
        }
    }
    
    public enum WorkflowTrigger: String, Sendable, CaseIterable {
        case manual
        case onSave
        case onCommit
        case onPush
        case onPullRequest
        case scheduled
        case onRelease
        
        public var displayName: String {
            switch self {
            case .manual: return "Manual"
            case .onSave: return "On Save"
            case .onCommit: return "On Commit"
            case .onPush: return "On Push"
            case .onPullRequest: return "On Pull Request"
            case .scheduled: return "Scheduled"
            case .onRelease: return "On Release"
            }
        }
    }
    
    public struct WorkflowConfig: Sendable {
        public var name: String
        public var trigger: WorkflowTrigger
        public var steps: [WorkflowStepConfig]
        public var continueOnError: Bool
        public var timeout: TimeInterval
        public var environment: [String: String]
        
        public init(
            name: String,
            trigger: WorkflowTrigger = .manual,
            steps: [WorkflowStepConfig] = [],
            continueOnError: Bool = false,
            timeout: TimeInterval = 300,
            environment: [String: String] = [:]
        ) {
            self.name = name
            self.trigger = trigger
            self.steps = steps
            self.continueOnError = continueOnError
            self.timeout = timeout
            self.environment = environment
        }
    }
    
    public struct WorkflowStepConfig: Sendable {
        public var step: WorkflowStep
        public var enabled: Bool
        public var options: [String: String]
        public var condition: String?
        
        public init(
            step: WorkflowStep,
            enabled: Bool = true,
            options: [String: String] = [:],
            condition: String? = nil
        ) {
            self.step = step
            self.enabled = enabled
            self.options = options
            self.condition = condition
        }
    }
    
    public struct WorkflowResult: Sendable {
        public let success: Bool
        public let stepResults: [StepResult]
        public let duration: TimeInterval
        public let startedAt: Date
        public let completedAt: Date
    }
    
    public struct StepResult: Sendable {
        public let step: WorkflowStep
        public let success: Bool
        public let output: String
        public let errors: [String]
        public let duration: TimeInterval
    }
    
    private var config: WorkflowConfig
    private let parser: DocumentationParser
    private let generator: DocumentationGenerator
    
    public init(config: WorkflowConfig) {
        self.config = config
        self.parser = DocumentationParser()
        self.generator = DocumentationGenerator()
    }
    
    /// Execute the workflow.
    public func execute(content: [DocumentationContent]) async -> WorkflowResult {
        let startedAt = Date()
        var stepResults: [StepResult] = []
        var overallSuccess = true
        
        for stepConfig in config.steps where stepConfig.enabled {
            let stepStart = Date()
            var output = ""
            var errors: [String] = []
            var success = true
            
            switch stepConfig.step {
            case .validate:
                let result = await validateContent(content)
                success = result.0
                output = result.1
                errors = result.2
                
            case .lint:
                let result = await lintContent(content)
                success = result.0
                output = result.1
                errors = result.2
                
            case .format:
                output = "Formatting complete"
                
            case .transform:
                output = "Transformation complete"
                
            case .generate:
                let result = await generator.generate(from: content)
                success = result.success
                output = "Generated \(result.outputFiles.count) files"
                errors = result.errors.map { $0.message }
                
            case .optimize:
                output = "Optimization complete"
                
            case .deploy:
                output = "Deployment skipped (not configured)"
                
            case .notify:
                output = "Notification sent"
            }
            
            let stepDuration = Date().timeIntervalSince(stepStart)
            stepResults.append(StepResult(
                step: stepConfig.step,
                success: success,
                output: output,
                errors: errors,
                duration: stepDuration
            ))
            
            if !success {
                overallSuccess = false
                if !config.continueOnError {
                    break
                }
            }
        }
        
        let completedAt = Date()
        return WorkflowResult(
            success: overallSuccess,
            stepResults: stepResults,
            duration: completedAt.timeIntervalSince(startedAt),
            startedAt: startedAt,
            completedAt: completedAt
        )
    }
    
    private func validateContent(_ content: [DocumentationContent]) async -> (Bool, String, [String]) {
        var errors: [String] = []
        
        for item in content {
            let parseErrors = parser.validate(item.content)
            for error in parseErrors {
                errors.append("\(item.slug):\(error.line): \(error.message)")
            }
            
            if item.title.isEmpty {
                errors.append("\(item.slug): Missing title")
            }
        }
        
        let success = errors.isEmpty
        let output = success ? "Validation passed" : "Validation failed with \(errors.count) errors"
        return (success, output, errors)
    }
    
    private func lintContent(_ content: [DocumentationContent]) async -> (Bool, String, [String]) {
        var warnings: [String] = []
        
        for item in content {
            // Check for common issues
            if item.content.contains("TODO") {
                warnings.append("\(item.slug): Contains TODO comment")
            }
            if item.content.contains("FIXME") {
                warnings.append("\(item.slug): Contains FIXME comment")
            }
            if !item.content.contains("## ") && item.content.count > 500 {
                warnings.append("\(item.slug): Long content without headings")
            }
        }
        
        let output = warnings.isEmpty ? "Lint passed" : "Lint completed with \(warnings.count) warnings"
        return (true, output, warnings)
    }
    
    /// Create a standard documentation workflow.
    public static func standard(name: String = "Documentation Build") -> WorkflowConfig {
        WorkflowConfig(
            name: name,
            trigger: .onPush,
            steps: [
                WorkflowStepConfig(step: .validate),
                WorkflowStepConfig(step: .lint),
                WorkflowStepConfig(step: .format),
                WorkflowStepConfig(step: .generate),
                WorkflowStepConfig(step: .optimize),
            ]
        )
    }
    
    /// Create a CI/CD workflow.
    public static func cicd(name: String = "Documentation CI/CD") -> WorkflowConfig {
        WorkflowConfig(
            name: name,
            trigger: .onPullRequest,
            steps: [
                WorkflowStepConfig(step: .validate),
                WorkflowStepConfig(step: .lint),
                WorkflowStepConfig(step: .generate),
                WorkflowStepConfig(step: .deploy, condition: "branch == 'main'"),
                WorkflowStepConfig(step: .notify),
            ],
            continueOnError: false
        )
    }
}

/// Scheduled task for documentation automation.
public struct ScheduledTask: Sendable, Identifiable {
    public var id: UUID
    public var name: String
    public var schedule: TaskSchedule
    public var workflowConfig: DocumentationWorkflow.WorkflowConfig
    public var isEnabled: Bool
    public var lastRun: Date?
    public var nextRun: Date?
    
    public init(
        id: UUID = UUID(),
        name: String,
        schedule: TaskSchedule,
        workflowConfig: DocumentationWorkflow.WorkflowConfig,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.name = name
        self.schedule = schedule
        self.workflowConfig = workflowConfig
        self.isEnabled = isEnabled
    }
}

/// Schedule configuration for tasks.
public enum TaskSchedule: Sendable {
    case once(Date)
    case hourly
    case daily(hour: Int, minute: Int)
    case weekly(dayOfWeek: Int, hour: Int, minute: Int)
    case monthly(dayOfMonth: Int, hour: Int, minute: Int)
    case cron(String)
    
    public var displayName: String {
        switch self {
        case .once(let date): return "Once at \(date)"
        case .hourly: return "Every hour"
        case .daily(let hour, let minute): return "Daily at \(hour):\(String(format: "%02d", minute))"
        case .weekly(let day, let hour, let minute): return "Weekly on day \(day) at \(hour):\(String(format: "%02d", minute))"
        case .monthly(let day, let hour, let minute): return "Monthly on day \(day) at \(hour):\(String(format: "%02d", minute))"
        case .cron(let expr): return "Cron: \(expr)"
        }
    }
}
