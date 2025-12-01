# Getting Started with DocumentationModule

Learn how to integrate and use DocumentationModule in your app.

## Overview

DocumentationModule provides SwiftData models for managing documentation content. This guide walks you through setup and basic usage.

## Setting Up the Model Container

First, configure SwiftData with all documentation models. You can use the
built-in persistence controller to avoid wiring the schema yourself:

```swift
import SwiftData
import DocumentationModule

@main
struct MyApp: App {
    let container: ModelContainer
    
    init() {
        container = DocumentationPersistenceController.shared
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
```

If you prefer to configure the schema manually, mirror the demo target by
specifying the primary documentation models explicitly:

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

## Creating Content

### Creating a Guide

```swift
let guide = GuideModel(
    title: "Installation Guide",
    content: "How to install the SDK",
    category: .gettingStarted,
    author: "Documentation Team"
)

guide.steps = [
    GuideStep(title: "Download", content: "Download the package", order: 1),
    GuideStep(title: "Install", content: "Run the installer", order: 2)
]

modelContext.insert(guide)
```

### Creating an Article

```swift
let article = ArticleModel(
    title: "What's New in Version 2.0",
    body: "We're excited to announce...",
    author: "Product Team",
    tags: ["release", "features"]
)

modelContext.insert(article)
```

### Creating a Tutorial

```swift
let tutorial = TutorialModel(
    title: "Build Your First Feature",
    difficulty: .beginner,
    estimatedTime: 30,
    prerequisites: ["Basic Swift knowledge"]
)

tutorial.steps = [
    TutorialStep(
        title: "Create the View",
        instructions: "Start by creating a new SwiftUI view...",
        order: 1,
        codeTemplate: "struct MyView: View { }"
    )
]

modelContext.insert(tutorial)
```

### Creating a Reference

```swift
let reference = ReferenceModel(
    title: "DocumentationModule.GuideModel",
    content: "A model representing step-by-step guides...",
    category: .api,
    relatedAPIs: ["ArticleModel", "TutorialModel"]
)

reference.codeExamples = [
    CodeExample(
        title: "Basic Usage",
        code: "let guide = GuideModel(title: \"...\", ...)",
        language: "swift"
    )
]

modelContext.insert(reference)
```

### Generating multi-format outputs for a new document

When a user selects a documentation type, keep Markdown, HTML, plain text, Pages, and DocC exports synchronized in a single call:

```swift
let content = DocumentationContent(
    title: "Release Notes",
    slug: "release-notes",
    content: "# Release Notes\n\nDetails for this version...",
    type: .changelog
)

let generator = DocumentationGenerator()
let result = await generator.generateAllFormats(from: [content])

if result.success {
    print("Created \(result.totalFiles) artifacts across \(result.resultsByFormat.keys.count) formats")
}
```

## Surfacing Counts in a Dashboard

`DocumentationStoreViewModel` provides taxonomy-aware counts for each
documentation type, powered by SwiftData queries:

```swift
let store = DocumentationStoreViewModel()
let context = ModelContext(DocumentationPersistenceController.inMemory())

try store.refresh(using: context)
print(store.summaries.map { "\($0.label): \($0.count)" }.joined(separator: ", "))
```

## Using Visual Identity

Each content type has associated visual properties:

```swift
// Get the icon for a guide
let icon = DocumentationIcon.guide.systemName // "book.fill"

// Get the color
let color = GuideModel.color // .guide (blue)

// Get the shape
let shape = GuideModel.shape // .guide (rounded rectangle)
```

## Rendering in SwiftUI

Pair your SwiftData queries with the visual identity helpers to build lists and dashboards quickly:

```swift
struct ContentListView: View {
    @Query private var articles: [ArticleModel]

    var body: some View {
        List(articles) { article in
            Label(article.title, systemImage: article.icon.systemName)
        }
        .navigationTitle("Documentation")
    }
}
```

## Topics

### Next Steps

- ``GuideModel``
- ``ArticleModel``
- ``TutorialModel``
- ``ReferenceModel``
