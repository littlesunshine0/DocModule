import Foundation
import Combine
import SwiftData

/// View model that summarizes SwiftData-backed documentation content for UI dashboards.
///
/// The model can be refreshed against any `ModelContext` (shared or in-memory)
/// to produce counts and taxonomy-aware summaries for automation surfaces.
@MainActor
public final class DocumentationStoreViewModel: ObservableObject {
    public struct Summary: Identifiable, Hashable {
        public let id: DocumentationType
        public let type: DocumentationType
        public let count: Int
        public let icon: DocumentationIcon
        public let color: DocumentationColor
        public let category: DocumentationCategory
        public let kind: DocumentationKind
        public let label: String
    }

    @Published public private(set) var summaries: [Summary] = []
    @Published public private(set) var lastRefresh: Date?

    public init() {}

    /// Refreshes counts for all documentation types using the provided context.
    public func refresh(using context: ModelContext) throws {
        var results: [Summary] = []

        func buildSummary(for type: DocumentationType, count: Int) -> Summary {
            Summary(
                id: type,
                type: type,
                count: count,
                icon: type.icon,
                color: type.color,
                category: type.category,
                kind: type.kind,
                label: type.taxonomyLabel
            )
        }

        func count<T: PersistentModel>(_ model: T.Type) throws -> Int {
            let descriptor = FetchDescriptor<T>()
            return try context.fetch(descriptor).count
        }

        results.append(buildSummary(for: .guide, count: try count(GuideModel.self)))
        results.append(buildSummary(for: .article, count: try count(ArticleModel.self)))
        results.append(buildSummary(for: .tutorial, count: try count(TutorialModel.self)))
        results.append(buildSummary(for: .reference, count: try count(ReferenceModel.self)))
        results.append(buildSummary(for: .changelog, count: try count(ChangelogModel.self)))
        results.append(buildSummary(for: .faq, count: try count(FAQModel.self)))
        results.append(buildSummary(for: .glossary, count: try count(GlossaryModel.self)))
        results.append(buildSummary(for: .snippet, count: try count(SnippetModel.self)))
        results.append(buildSummary(for: .diagram, count: try count(DiagramModel.self)))
        results.append(buildSummary(for: .video, count: try count(VideoModel.self)))
        results.append(buildSummary(for: .sample, count: try count(SampleModel.self)))
        results.append(buildSummary(for: .troubleshooting, count: try count(TroubleshootingModel.self)))
        results.append(buildSummary(for: .caseStudy, count: try count(CaseStudyModel.self)))
        results.append(buildSummary(for: .whitepaper, count: try count(WhitepaperModel.self)))
        results.append(buildSummary(for: .integration, count: try count(IntegrationModel.self)))
        results.append(buildSummary(for: .roadmap, count: try count(RoadmapModel.self)))
        results.append(buildSummary(for: .useCase, count: try count(UseCaseModel.self)))
        results.append(buildSummary(for: .playbook, count: try count(PlaybookModel.self)))
        results.append(buildSummary(for: .policy, count: try count(PolicyModel.self)))
        results.append(buildSummary(for: .readme, count: try count(ReadmeModel.self)))
        results.append(buildSummary(for: .requirements, count: try count(RequirementsModel.self)))
        results.append(buildSummary(for: .tasks, count: try count(TaskListModel.self)))
        results.append(buildSummary(for: .design, count: try count(DesignDocModel.self)))
        results.append(buildSummary(for: .blueprint, count: try count(BlueprintModel.self)))
        results.append(buildSummary(for: .guides, count: try count(GuideCollectionModel.self)))
        results.append(buildSummary(for: .framework, count: try count(FrameworkModel.self)))
        results.append(buildSummary(for: .research, count: try count(ResearchModel.self)))
        results.append(buildSummary(for: .view, count: try count(ViewDocumentationModel.self)))
        results.append(buildSummary(for: .viewModel, count: try count(ViewModelDocumentationModel.self)))
        results.append(buildSummary(for: .dataModel, count: try count(DataModelDocumentationModel.self)))
        results.append(buildSummary(for: .service, count: try count(ServiceDocumentationModel.self)))
        results.append(buildSummary(for: .manager, count: try count(ManagerDocumentationModel.self)))
        results.append(buildSummary(for: .checkpoint, count: try count(CheckpointDocumentationModel.self)))
        results.append(buildSummary(for: .milestone, count: try count(MilestoneDocumentationModel.self)))
        results.append(buildSummary(for: .event, count: try count(EventDocumentationModel.self)))
        results.append(buildSummary(for: .otherDocumentation, count: try count(OtherDocumentationModel.self)))

        summaries = results
        lastRefresh = Date()
    }
}
