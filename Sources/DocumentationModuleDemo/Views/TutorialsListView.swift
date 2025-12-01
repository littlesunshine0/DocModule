import SwiftUI
import DocumentationModule

struct TutorialsListView: View {
    let tutorials: [TutorialModel]
    
    var body: some View {
        List {
            if tutorials.isEmpty {
                ContentUnavailableView(
                    "No Tutorials",
                    systemImage: DocumentationIcon.tutorial.systemName,
                    description: Text("Tap + to add a tutorial")
                )
            } else {
                ForEach(tutorials, id: \.id) { tutorial in
                    NavigationLink {
                        TutorialDetailView(tutorial: tutorial)
                    } label: {
                        ContentRowView(
                            icon: tutorial.icon,
                            color: TutorialModel.color,
                            shape: TutorialModel.shape,
                            title: tutorial.title,
                            subtitle: "\(tutorial.difficulty.displayName) • \(tutorial.estimatedTime) min"
                        )
                    }
                }
            }
        }
    }
}

struct TutorialDetailView: View {
    let tutorial: TutorialModel
    
    var body: some View {
        List {
            Section("Overview") {
                HStack {
                    DifficultyBadge(difficulty: tutorial.difficulty)
                    Spacer()
                    Label("\(tutorial.estimatedTime) min", systemImage: "clock")
                        .font(.caption)
                }
            }
            
            if !tutorial.prerequisites.isEmpty {
                Section("Prerequisites") {
                    ForEach(tutorial.prerequisites, id: \.self) { prereq in
                        Label(prereq, systemImage: "checkmark.circle")
                    }
                }
            }
            
            Section("Steps") {
                ForEach(tutorial.steps.sorted { $0.order < $1.order }) { step in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Step \(step.order): \(step.title)")
                            .font(.headline)
                        Text(step.instructions)
                            .font(.body)
                            .foregroundStyle(.secondary)
                        if let code = step.codeTemplate {
                            Text(code)
                                .font(.system(.caption, design: .monospaced))
                                .padding(8)
                                .background(Color.secondary.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Section("Metadata") {
                LabeledContent("Category", value: tutorial.category.displayName)
                LabeledContent("Completions", value: "\(tutorial.completionCount)")
                LabeledContent("Published", value: tutorial.isPublished ? "Yes" : "No")
            }
        }
        .navigationTitle(tutorial.title)
    }
}

struct DifficultyBadge: View {
    let difficulty: TutorialDifficulty
    
    var color: Color {
        switch difficulty {
        case .beginner: return .green
        case .intermediate: return .orange
        case .advanced: return .red
        case .expert: return .purple
        }
    }
    
    var body: some View {
        Text(difficulty.displayName)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color.opacity(0.2))
            .foregroundStyle(color)
            .clipShape(Capsule())
    }
}
