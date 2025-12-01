import Foundation

/// Help system for documentation module.
public struct DocumentationHelp: Sendable {
    
    /// Help topic categories.
    public enum HelpCategory: String, CaseIterable, Sendable {
        case gettingStarted = "Getting Started"
        case contentTypes = "Content Types"
        case editing = "Editing"
        case formatting = "Formatting"
        case extensions = "Extensions"
        case automation = "Automation"
        case publishing = "Publishing"
        case troubleshooting = "Troubleshooting"
        case shortcuts = "Keyboard Shortcuts"
        case api = "API Reference"
    }
    
    /// A help topic.
    public struct HelpTopic: Sendable, Identifiable {
        public let id: String
        public let title: String
        public let category: HelpCategory
        public let summary: String
        public let content: String
        public let relatedTopics: [String]
        public let keywords: [String]
    }
    
    /// All available help topics.
    public static let topics: [HelpTopic] = [
        // Getting Started
        HelpTopic(
            id: "intro",
            title: "Introduction to Documentation Module",
            category: .gettingStarted,
            summary: "Learn the basics of creating and managing documentation.",
            content: """
            # Introduction
            
            Documentation Module provides a comprehensive system for creating, managing, and publishing documentation.
            
            ## Key Features
            
            - Multiple content types (guides, articles, tutorials, references, and more)
            - Rich markdown extensions
            - Automated workflows
            - Multiple output formats
            
            ## Quick Start
            
            1. Create a new documentation item
            2. Choose a content type
            3. Write your content using markdown
            4. Preview and publish
            """,
            relatedTopics: ["content-types", "markdown-basics"],
            keywords: ["introduction", "getting started", "basics"]
        ),
        
        // Content Types
        HelpTopic(
            id: "content-types",
            title: "Understanding Content Types",
            category: .contentTypes,
            summary: "Learn about the different types of documentation you can create.",
            content: """
            # Content Types
            
            Documentation Module supports 12 different content types:
            
            ## Guide
            Step-by-step instructions for completing tasks. Best for installation guides, configuration walkthroughs.
            
            ## Article
            Long-form written content. Best for blog posts, announcements, conceptual explanations.
            
            ## Tutorial
            Interactive hands-on learning. Best for building sample projects, skill-building exercises.
            
            ## Reference
            Technical API documentation. Best for method descriptions, type references.
            
            ## Changelog
            Version history and release notes. Best for tracking changes across versions.
            
            ## FAQ
            Frequently asked questions. Best for common questions and quick answers.
            
            ## Glossary
            Term definitions. Best for technical vocabulary and concepts.
            
            ## Snippet
            Reusable code examples. Best for common patterns and solutions.
            
            ## Diagram
            Visual representations. Best for architecture, flowcharts, relationships.
            
            ## Video
            Video tutorials. Best for demonstrations and walkthroughs.
            
            ## Sample
            Complete sample projects. Best for reference implementations.
            
            ## Troubleshooting
            Problem-solution guides. Best for common issues and fixes.
            """,
            relatedTopics: ["guide-model", "article-model", "tutorial-model"],
            keywords: ["content", "types", "guide", "article", "tutorial"]
        ),
        
        // Formatting
        HelpTopic(
            id: "markdown-basics",
            title: "Markdown Basics",
            category: .formatting,
            summary: "Learn the markdown syntax supported in documentation.",
            content: """
            # Markdown Basics
            
            ## Headings
            ```
            # Heading 1
            ## Heading 2
            ### Heading 3
            ```
            
            ## Text Formatting
            ```
            **bold** or __bold__
            *italic* or _italic_
            ~~strikethrough~~
            `inline code`
            ```
            
            ## Lists
            ```
            - Unordered item
            - Another item
            
            1. Ordered item
            2. Another item
            ```
            
            ## Links and Images
            ```
            [Link text](url)
            ![Alt text](image-url)
            ```
            
            ## Code Blocks
            ```
            ```swift
            let code = "example"
            ```
            ```
            
            ## Blockquotes
            ```
            > This is a quote
            ```
            """,
            relatedTopics: ["markdown-extensions", "code-blocks"],
            keywords: ["markdown", "formatting", "syntax"]
        ),
        
        // Extensions
        HelpTopic(
            id: "markdown-extensions",
            title: "Markdown Extensions",
            category: .extensions,
            summary: "Learn about custom markdown extensions for enhanced documentation.",
            content: """
            # Markdown Extensions
            
            ## Callouts
            ```
            :::note
            This is a note.
            :::
            
            :::warning
            This is a warning.
            :::
            
            :::tip
            This is a tip.
            :::
            ```
            
            ## Tab Groups
            ```
            :::tabs
            @tab Swift
            Swift code here
            
            @tab Kotlin
            Kotlin code here
            :::
            ```
            
            ## Collapsible Sections
            ```
            :::details[Click to expand]
            Hidden content here.
            :::
            ```
            
            ## Badges
            ```
            [[badge:New:green]]
            [[badge:Beta:orange]]
            ```
            
            ## API References
            ```
            [[api:SwiftUI.View]]
            ```
            
            ## Keyboard Shortcuts
            ```
            [[kbd:Cmd+Shift+P]]
            ```
            """,
            relatedTopics: ["markdown-basics", "callouts"],
            keywords: ["extensions", "callouts", "tabs", "badges"]
        ),
        
        // Shortcuts
        HelpTopic(
            id: "keyboard-shortcuts",
            title: "Keyboard Shortcuts",
            category: .shortcuts,
            summary: "Quick reference for all keyboard shortcuts.",
            content: """
            # Keyboard Shortcuts
            
            ## Content
            | Action | Shortcut |
            |--------|----------|
            | Create New | ⌘N |
            | Edit | ⌘E |
            | Delete | ⌘⌫ |
            | Duplicate | ⌘D |
            | Rename | ⏎ |
            
            ## Formatting
            | Action | Shortcut |
            |--------|----------|
            | Bold | ⌘B |
            | Italic | ⌘I |
            | Code | ⌘E |
            | Link | ⌘K |
            | Heading 1 | ⌘1 |
            | Heading 2 | ⌘2 |
            | Heading 3 | ⌘3 |
            
            ## Build
            | Action | Shortcut |
            |--------|----------|
            | Build | ⌘B |
            | Clean | ⌘⇧K |
            | Rebuild | ⌘⇧B |
            
            ## Navigation
            | Action | Shortcut |
            |--------|----------|
            | Search | ⌘F |
            | Find & Replace | ⌘⌥F |
            | Go to Definition | ⌘⌥D |
            """,
            relatedTopics: ["commands", "editing"],
            keywords: ["shortcuts", "keyboard", "hotkeys"]
        ),
        
        // Automation
        HelpTopic(
            id: "workflows",
            title: "Automation Workflows",
            category: .automation,
            summary: "Learn how to automate documentation tasks.",
            content: """
            # Automation Workflows
            
            ## Workflow Steps
            
            1. **Validate** - Check documentation structure
            2. **Lint** - Check style and formatting
            3. **Format** - Auto-format content
            4. **Transform** - Apply transformations
            5. **Generate** - Build output files
            6. **Optimize** - Optimize assets
            7. **Deploy** - Deploy to hosting
            8. **Notify** - Send notifications
            
            ## Triggers
            
            - Manual
            - On Save
            - On Commit
            - On Push
            - On Pull Request
            - Scheduled
            - On Release
            
            ## Example Workflow
            
            ```swift
            let workflow = DocumentationWorkflow(
                config: .standard(name: "My Workflow")
            )
            let result = await workflow.execute(content: myContent)
            ```
            """,
            relatedTopics: ["publishing", "validation"],
            keywords: ["automation", "workflow", "ci", "cd"]
        ),
    ]
    
    /// Search help topics.
    public static func search(_ query: String) -> [HelpTopic] {
        let lowercasedQuery = query.lowercased()
        return topics.filter { topic in
            topic.title.lowercased().contains(lowercasedQuery) ||
            topic.summary.lowercased().contains(lowercasedQuery) ||
            topic.keywords.contains { $0.lowercased().contains(lowercasedQuery) }
        }
    }
    
    /// Get topics by category.
    public static func topics(for category: HelpCategory) -> [HelpTopic] {
        topics.filter { $0.category == category }
    }
    
    /// Get a specific topic by ID.
    public static func topic(id: String) -> HelpTopic? {
        topics.first { $0.id == id }
    }
    
    /// Get related topics for a topic.
    public static func relatedTopics(for topicID: String) -> [HelpTopic] {
        guard let topic = topic(id: topicID) else { return [] }
        return topic.relatedTopics.compactMap { self.topic(id: $0) }
    }
}

/// Contextual help provider.
public struct ContextualHelp: Sendable {
    
    /// Get help for a specific context.
    public static func help(for context: HelpContext) -> String {
        switch context {
        case .editor:
            return "Use markdown to format your content. Press ⌘/ for shortcuts."
        case .preview:
            return "This is a preview of your documentation output."
        case .sidebar:
            return "Navigate your documentation structure here."
        case .toolbar:
            return "Quick access to common actions."
        case .contentType(let type):
            return type.description
        case .command(let command):
            return command.helpText
        case .extension(let ext):
            return ext.description
        }
    }
    
    public enum HelpContext: Sendable {
        case editor
        case preview
        case sidebar
        case toolbar
        case contentType(DocumentationType)
        case command(DocumentationCommand)
        case `extension`(MarkdownExtension)
    }
}
