import SwiftUI
import DocumentationModule

struct GuidesListView: View {
    let guides: [GuideModel]
    
    var body: some View {
        List {
            if guides.isEmpty {
                ContentUnavailableView(
                    "No Guides",
                    systemImage: DocumentationIcon.guide.systemName,
                    description: Text("Tap + to add a guide")
                )
            } else {
                ForEach(guides, id: \.id) { guide in
                    NavigationLink {
                        GuideDetailView(guide: guide)
                    } label: {
                        ContentRowView(
                            icon: guide.icon,
                            color: GuideModel.color,
                            shape: GuideModel.shape,
                            title: guide.title,
                            subtitle: "\(guide.steps.count) steps • \(guide.category.displayName)"
                        )
                    }
                }
            }
        }
    }
}

struct GuideDetailView: View {
    let guide: GuideModel
    
    var body: some View {
        List {
            Section("Overview") {
                Text(guide.content)
            }
            
            Section("Steps") {
                ForEach(guide.steps.sorted { $0.order < $1.order }) { step in
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Step \(step.order): \(step.title)")
                            .font(.headline)
                        Text(step.content)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Section("Metadata") {
                LabeledContent("Author", value: guide.author)
                LabeledContent("Category", value: guide.category.displayName)
                LabeledContent("Views", value: "\(guide.viewCount)")
                LabeledContent("Published", value: guide.isPublished ? "Yes" : "No")
            }
        }
        .navigationTitle(guide.title)
    }
}
