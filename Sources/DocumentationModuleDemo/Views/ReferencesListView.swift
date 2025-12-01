import SwiftUI
import DocumentationModule

struct ReferencesListView: View {
    let references: [ReferenceModel]
    
    var body: some View {
        List {
            if references.isEmpty {
                ContentUnavailableView(
                    "No References",
                    systemImage: DocumentationIcon.reference.systemName,
                    description: Text("Tap + to add a reference")
                )
            } else {
                ForEach(references, id: \.id) { reference in
                    NavigationLink {
                        ReferenceDetailView(reference: reference)
                    } label: {
                        ContentRowView(
                            icon: reference.icon,
                            color: ReferenceModel.color,
                            shape: ReferenceModel.shape,
                            title: reference.title,
                            subtitle: reference.category.displayName
                        )
                    }
                }
            }
        }
    }
}

struct ReferenceDetailView: View {
    let reference: ReferenceModel
    
    var body: some View {
        List {
            Section("Description") {
                Text(reference.content)
            }
            
            if !reference.relatedAPIs.isEmpty {
                Section("Related APIs") {
                    ForEach(reference.relatedAPIs, id: \.self) { api in
                        Label(api, systemImage: "link")
                    }
                }
            }
            
            if !reference.codeExamples.isEmpty {
                Section("Code Examples") {
                    ForEach(reference.codeExamples) { example in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(example.title)
                                .font(.headline)
                            Text(example.code)
                                .font(.system(.body, design: .monospaced))
                                .padding(8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.secondary.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            if let desc = example.description {
                                Text(desc)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            
            Section("Metadata") {
                LabeledContent("Category", value: reference.category.displayName)
                LabeledContent("Views", value: "\(reference.viewCount)")
                LabeledContent("Published", value: reference.isPublished ? "Yes" : "No")
            }
        }
        .navigationTitle(reference.title)
    }
}
