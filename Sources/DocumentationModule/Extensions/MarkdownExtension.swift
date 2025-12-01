import Foundation

/// Custom markdown extensions for documentation content.
public enum MarkdownExtension: String, Codable, Sendable, CaseIterable {
    case callout
    case codeBlock
    case tabGroup
    case collapsible
    case badge
    case tooltip
    case linkCard
    case imageGallery
    case videoEmbed
    case mermaidDiagram
    case mathEquation
    case apiReference
    case keyboardShortcut
    case fileTree
    case diffBlock
    case timeline
    
    public var syntax: String {
        switch self {
        case .callout: return ":::note|warning|tip|important"
        case .codeBlock: return "```language:filename"
        case .tabGroup: return ":::tabs"
        case .collapsible: return ":::details[title]"
        case .badge: return "[[badge:text:color]]"
        case .tooltip: return "[[tooltip:text:content]]"
        case .linkCard: return "[[card:url]]"
        case .imageGallery: return ":::gallery"
        case .videoEmbed: return "[[video:url]]"
        case .mermaidDiagram: return "```mermaid"
        case .mathEquation: return "$equation$ or $$block$$"
        case .apiReference: return "[[api:symbol]]"
        case .keyboardShortcut: return "[[kbd:keys]]"
        case .fileTree: return ":::filetree"
        case .diffBlock: return "```diff"
        case .timeline: return ":::timeline"
        }
    }
    
    public var description: String {
        switch self {
        case .callout: return "Highlighted callout boxes for notes, warnings, tips"
        case .codeBlock: return "Syntax-highlighted code with filename"
        case .tabGroup: return "Tabbed content sections"
        case .collapsible: return "Expandable/collapsible sections"
        case .badge: return "Inline colored badges"
        case .tooltip: return "Hover tooltips"
        case .linkCard: return "Rich link preview cards"
        case .imageGallery: return "Image gallery with lightbox"
        case .videoEmbed: return "Embedded video player"
        case .mermaidDiagram: return "Mermaid diagram rendering"
        case .mathEquation: return "LaTeX math equations"
        case .apiReference: return "API symbol links"
        case .keyboardShortcut: return "Keyboard shortcut display"
        case .fileTree: return "File/folder tree visualization"
        case .diffBlock: return "Code diff highlighting"
        case .timeline: return "Timeline/changelog display"
        }
    }
    
    public var example: String {
        switch self {
        case .callout:
            return """
            :::note
            This is a note callout.
            :::
            """
        case .codeBlock:
            return """
            ```swift:ContentView.swift
            struct ContentView: View {
                var body: some View {
                    Text("Hello")
                }
            }
            ```
            """
        case .tabGroup:
            return """
            :::tabs
            @tab Swift
            ```swift
            let x = 1
            ```
            @tab Kotlin
            ```kotlin
            val x = 1
            ```
            :::
            """
        case .collapsible:
            return """
            :::details[Click to expand]
            Hidden content here.
            :::
            """
        case .badge:
            return "[[badge:New:green]] [[badge:Beta:orange]]"
        case .tooltip:
            return "Hover over [[tooltip:this:More information here]] for details."
        case .linkCard:
            return "[[card:https://developer.apple.com]]"
        case .imageGallery:
            return """
            :::gallery
            ![Image 1](img1.png)
            ![Image 2](img2.png)
            :::
            """
        case .videoEmbed:
            return "[[video:https://youtube.com/watch?v=xxx]]"
        case .mermaidDiagram:
            return """
            ```mermaid
            flowchart LR
                A --> B --> C
            ```
            """
        case .mathEquation:
            return "$E = mc^2$ or $$\\sum_{i=1}^n x_i$$"
        case .apiReference:
            return "See [[api:SwiftUI.View]] for more details."
        case .keyboardShortcut:
            return "Press [[kbd:Cmd+Shift+P]] to open."
        case .fileTree:
            return """
            :::filetree
            - src/
              - main.swift
              - utils/
                - helpers.swift
            :::
            """
        case .diffBlock:
            return """
            ```diff
            - old line
            + new line
            ```
            """
        case .timeline:
            return """
            :::timeline
            @2024-01-01 Initial release
            @2024-02-15 Added new features
            :::
            """
        }
    }
}

/// Callout types for documentation.
public enum CalloutType: String, Codable, Sendable, CaseIterable {
    case note, tip, warning, important, caution, info, success, danger, experiment
    
    public var icon: String {
        switch self {
        case .note: return "pencil.circle.fill"
        case .tip: return "lightbulb.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .important: return "exclamationmark.circle.fill"
        case .caution: return "hand.raised.fill"
        case .info: return "info.circle.fill"
        case .success: return "checkmark.circle.fill"
        case .danger: return "xmark.octagon.fill"
        case .experiment: return "flask.fill"
        }
    }
    
    public var color: String {
        switch self {
        case .note: return "#5856D6"
        case .tip: return "#34C759"
        case .warning: return "#FF9500"
        case .important: return "#007AFF"
        case .caution: return "#FFCC00"
        case .info: return "#5AC8FA"
        case .success: return "#34C759"
        case .danger: return "#FF3B30"
        case .experiment: return "#AF52DE"
        }
    }
}
