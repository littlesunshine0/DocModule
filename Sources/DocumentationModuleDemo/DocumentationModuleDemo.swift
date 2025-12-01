import SwiftUI
import SwiftData
import DocumentationModule

/// A demo app showcasing the DocumentationModule.
@main
struct DocumentationModuleDemo: App {
    let container: ModelContainer
    
    init() {
        let schema = Schema([
            GuideModel.self,
            ArticleModel.self,
            TutorialModel.self,
            ReferenceModel.self
        ])
        do {
            container = try ModelContainer(for: schema)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentListView()
        }
        .modelContainer(container)
    }
}

// MARK: - Content List View

struct ContentListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var guides: [GuideModel]
    @Query private var articles: [ArticleModel]
    @Query private var tutorials: [TutorialModel]
    @Query private var references: [ReferenceModel]
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                GuidesListView(guides: guides)
                    .tabItem {
                        Label("Guides", systemImage: DocumentationIcon.guide.systemName)
                    }
                    .tag(0)
                
                ArticlesListView(articles: articles)
                    .tabItem {
                        Label("Articles", systemImage: DocumentationIcon.article.systemName)
                    }
                    .tag(1)
                
                TutorialsListView(tutorials: tutorials)
                    .tabItem {
                        Label("Tutorials", systemImage: DocumentationIcon.tutorial.systemName)
                    }
                    .tag(2)
                
                ReferencesListView(references: references)
                    .tabItem {
                        Label("References", systemImage: DocumentationIcon.reference.systemName)
                    }
                    .tag(3)
            }
            .navigationTitle("Documentation")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button("Add Guide") { addSampleGuide() }
                        Button("Add Article") { addSampleArticle() }
                        Button("Add Tutorial") { addSampleTutorial() }
                        Button("Add Reference") { addSampleReference() }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func addSampleGuide() {
        let guide = GuideModel(
            title: "Getting Started Guide",
            content: "Learn how to set up your development environment.",
            category: .gettingStarted,
            author: "Demo Team"
        )
        guide.steps = [
            GuideStep(title: "Install Xcode", content: "Download Xcode from the App Store.", order: 1),
            GuideStep(title: "Create Project", content: "Create a new SwiftUI project.", order: 2),
            GuideStep(title: "Run App", content: "Press Cmd+R to run your app.", order: 3)
        ]
        modelContext.insert(guide)
    }
    
    private func addSampleArticle() {
        let article = ArticleModel(
            title: "What's New in SwiftUI",
            body: "SwiftUI continues to evolve with powerful new features...",
            author: "Swift Team",
            tags: ["swiftui", "ios", "updates"]
        )
        modelContext.insert(article)
    }
    
    private func addSampleTutorial() {
        let tutorial = TutorialModel(
            title: "Build a Todo App",
            difficulty: .beginner,
            estimatedTime: 45,
            prerequisites: ["Basic Swift", "SwiftUI fundamentals"]
        )
        tutorial.steps = [
            TutorialStep(title: "Create Model", instructions: "Define a Todo struct.", order: 1),
            TutorialStep(title: "Build UI", instructions: "Create the list view.", order: 2)
        ]
        modelContext.insert(tutorial)
    }
    
    private func addSampleReference() {
        let reference = ReferenceModel(
            title: "GuideModel",
            content: "A SwiftData model for step-by-step guides.",
            category: .api,
            relatedAPIs: ["ArticleModel", "TutorialModel"]
        )
        reference.codeExamples = [
            CodeExample(title: "Create Guide", code: "let guide = GuideModel(...)", language: "swift")
        ]
        modelContext.insert(reference)
    }
}
