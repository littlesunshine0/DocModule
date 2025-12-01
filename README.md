# DocumentationModule

DocumentationModule is a SwiftData-first toolkit for structuring, authoring, and presenting documentation content across guides, articles, tutorials, and references. It ships with visual identity helpers, taxonomy metadata, and a SwiftUI demo that shows how to query and seed content on every Apple platform that supports SwiftData.

## Features
- 35+ documentation models spanning guides, articles, tutorials, references, changelogs, FAQs, and more
- SwiftData-ready schemas for storing and querying documentation content with minimal setup
- Visual identity helpers for icons, colors, and shapes to keep documentation surfaces consistent
- Taxonomy metadata (type, kind, category) for navigation, filtering, and automation
- Demo SwiftUI app that illustrates multi-tab browsing and authoring flows

## Targets
- **DocumentationModule (library)** — SwiftData models, taxonomy helpers, and visual identity utilities
- **DocumentationModuleDemo (executable)** — SwiftUI demo showcasing queries, tabs, and sample content insertion

## Requirements
- Swift 5.9+
- iOS 17.0+, macOS 14.0+, tvOS 17.0+, watchOS 10.0+, visionOS 1.0+

## Usage
Add the package to your `Package.swift`:

```swift
.package(url: "https://example.com/DocumentationModule.git", from: "1.0.0")
```

Configure a SwiftData container with the primary documentation models:

```swift
import DocumentationModule
import SwiftData

let schema = Schema([
    GuideModel.self,
    ArticleModel.self,
    TutorialModel.self,
    ReferenceModel.self
])
let container = try ModelContainer(for: schema)
```

Seed content with sensible defaults for icons, colors, and taxonomy metadata:

```swift
let article = ArticleModel(
    title: "What's New in SwiftUI",
    body: "SwiftUI continues to evolve with powerful new features...",
    author: "Documentation Team",
    tags: ["swiftui", "updates"],
    category: .fundamentals
)
modelContext.insert(article)
```

Automatically create multi-format outputs (Markdown, HTML, plain text, Pages, and DocC) when a user picks a documentation type:

```swift
let content = DocumentationContent(
    title: "Getting Started Guide",
    slug: "getting-started",
    content: "# Welcome\n\nFollow these steps to set up your project...",
    type: .guide
)

let generator = DocumentationGenerator()
let multiResult = await generator.generateAllFormats(from: [content])

// multiResult.resultsByFormat[.markdown], [.html], [.plainText], [.pages], [.docC]
// keep generated artifacts in sync for every new document
```

## Documentation
A DocC catalog lives at `Sources/DocumentationModule/DocumentationModule.docc` with an overview and getting-started guide. Preview it locally with Xcode or via the DocC preview server:

```bash
xcrun docc preview Sources/DocumentationModule/DocumentationModule.docc --port 8000
```

Browse the [Documentation Models Catalog](DocumentationModels.md) to see every SwiftData documentation type and ensure your Markdown includes at least one of each.

## Demo
Run the SwiftUI demo to explore multi-tab browsing and sample content insertion:

```bash
swift run DocumentationModuleDemo
```
