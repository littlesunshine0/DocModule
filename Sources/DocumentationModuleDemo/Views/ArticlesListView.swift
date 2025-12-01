import SwiftUI
import DocumentationModule

struct ArticlesListView: View {
    let articles: [ArticleModel]
    
    var body: some View {
        List {
            if articles.isEmpty {
                ContentUnavailableView(
                    "No Articles",
                    systemImage: DocumentationIcon.article.systemName,
                    description: Text("Tap + to add an article")
                )
            } else {
                ForEach(articles, id: \.id) { article in
                    NavigationLink {
                        ArticleDetailView(article: article)
                    } label: {
                        ContentRowView(
                            icon: article.icon,
                            color: ArticleModel.color,
                            shape: ArticleModel.shape,
                            title: article.title,
                            subtitle: article.tags.joined(separator: ", ")
                        )
                    }
                }
            }
        }
    }
}

struct ArticleDetailView: View {
    let article: ArticleModel
    
    var body: some View {
        List {
            Section("Content") {
                Text(article.body)
            }
            
            if !article.tags.isEmpty {
                Section("Tags") {
                    FlowLayout(spacing: 8) {
                        ForEach(article.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color(ArticleModel.color.hexValue).opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                }
            }
            
            Section("Metadata") {
                LabeledContent("Author", value: article.author)
                LabeledContent("Category", value: article.category.displayName)
                LabeledContent("Views", value: "\(article.viewCount)")
                LabeledContent("Published", value: article.isPublished ? "Yes" : "No")
            }
        }
        .navigationTitle(article.title)
    }
}

// Simple flow layout for tags
struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        for (index, frame) in result.frames.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + frame.minX, y: bounds.minY + frame.minY), proposal: .unspecified)
        }
    }
    
    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, frames: [CGRect]) {
        let maxWidth = proposal.width ?? .infinity
        var frames: [CGRect] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth && x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            frames.append(CGRect(origin: CGPoint(x: x, y: y), size: size))
            x += size.width + spacing
            rowHeight = max(rowHeight, size.height)
        }
        
        return (CGSize(width: maxWidth, height: y + rowHeight), frames)
    }
}
