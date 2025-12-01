# ``DocumentationModule``

A comprehensive SwiftData-powered module for documentation content management.

## Overview

DocumentationModule provides 12 content types, rich markdown extensions, animations, parsing, generation, and automation workflows for building complete documentation systems.

### Content Types at a Glance

| Type | Icon | Color | Shape | Use Case |
|------|------|-------|-------|----------|
| Guide | 📘 book.fill | Blue | Rounded Rectangle | Step-by-step instructions |
| Article | 📄 doc.text.fill | Green | Circle | Long-form content |
| Tutorial | 💡 lightbulb.fill | Orange | Hexagon | Interactive learning |
| Reference | 🔧 curlybraces | Purple | Square | API documentation |
| Changelog | 🕐 clock.arrow.circlepath | Indigo | Diamond | Version history |
| FAQ | ❓ questionmark.circle.fill | Teal | Capsule | Q&A content |
| Glossary | 📖 character.book.closed.fill | Brown | Rectangle | Term definitions |
| Snippet | 📝 doc.text.below.ecg | Cyan | Rounded Square | Code examples |
| Diagram | 📊 flowchart.fill | Pink | Octagon | Visual diagrams |
| Video | 🎬 play.rectangle.fill | Red | Stadium | Video tutorials |
| Sample | 📁 folder.fill.badge.gearshape | Mint | Pentagon | Sample projects |
| Troubleshooting | 🔧 wrench.and.screwdriver.fill | Yellow | Triangle | Problem-solution guides |

### Quick Start

```swift
import SwiftData
import DocumentationModule

// Create a model container with all content types
let schema = Schema([
    GuideModel.self,
    ArticleModel.self,
    TutorialModel.self,
    ReferenceModel.self,
    ChangelogModel.self,
    FAQModel.self,
    GlossaryModel.self,
    SnippetModel.self,
    DiagramModel.self,
    VideoModel.self,
    SampleModel.self,
    TroubleshootingModel.self
])
let container = try ModelContainer(for: schema)
```

## Topics

### Content Models

- ``GuideModel``
- ``ArticleModel``
- ``TutorialModel``
- ``ReferenceModel``
- ``ChangelogModel``
- ``FAQModel``
- ``GlossaryModel``
- ``SnippetModel``
- ``DiagramModel``
- ``VideoModel``
- ``SampleModel``
- ``TroubleshootingModel``

### Supporting Types

- ``GuideStep``
- ``TutorialStep``
- ``TutorialDifficulty``
- ``CodeExample``
- ``ChangeEntry``
- ``FAQEntry``
- ``GlossaryTerm``
- ``VideoChapter``
- ``DiagramNode``
- ``DiagramEdge``
- ``SampleFile``
- ``TroubleshootingEntry``

### Visual Identity

- ``DocumentationType``
- ``DocumentationIcon``
- ``DocumentationColor``
- ``DocumentationShape``
- ``ContentCategory``

### Markdown Extensions

- ``MarkdownExtension``
- ``CalloutType``

### Animations & Motion

- ``AnimationType``
- ``AnimationConfig``
- ``MotionEffect``
- ``MotionConfig``
- ``TransitionEffect``

### Parser

- ``DocumentationParser``

### Editor

- ``DocumentationEditor``
- ``EditorSnippet``

### Generator

- ``DocumentationGenerator``
- ``DocumentationContent``
- ``DocumentationTheme``

### Automation

- ``DocumentationWorkflow``
- ``ScheduledTask``
- ``TaskSchedule``

### Commands & Actions

- ``DocumentationCommand``
- ``CommandCategory``
- ``DocumentationAction``
- ``ActionResult``
- ``ActionDispatcher``

### Help System

- ``DocumentationHelp``
- ``ContextualHelp``
