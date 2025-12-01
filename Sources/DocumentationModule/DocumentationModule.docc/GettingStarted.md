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

## Topics

### Next Steps

- ``GuideModel``
- ``ArticleModel``
- ``TutorialModel``
- ``ReferenceModel``
