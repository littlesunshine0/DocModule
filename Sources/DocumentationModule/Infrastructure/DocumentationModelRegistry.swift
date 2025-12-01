import Foundation
import SwiftData

/// Central registry of all SwiftData documentation models used by the module.
///
/// Keeping the list in one place allows persistence controllers, view models,
/// and higher-level services to configure containers and iterate over supported
/// documentation types without duplicating type declarations.
public enum DocumentationModelRegistry {
    /// Ordered list of every `@Model` class provided by the module.
    public static let allModels: [any PersistentModel.Type] = [
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
        TroubleshootingModel.self,
        CaseStudyModel.self,
        WhitepaperModel.self,
        IntegrationModel.self,
        RoadmapModel.self,
        UseCaseModel.self,
        PlaybookModel.self,
        PolicyModel.self,
        ReadmeModel.self,
        RequirementsModel.self,
        TaskListModel.self,
        DesignDocModel.self,
        BlueprintModel.self,
        GuideCollectionModel.self,
        FrameworkModel.self,
        ResearchModel.self,
        ViewDocumentationModel.self,
        ViewModelDocumentationModel.self,
        DataModelDocumentationModel.self,
        ServiceDocumentationModel.self,
        ManagerDocumentationModel.self,
        CheckpointDocumentationModel.self,
        MilestoneDocumentationModel.self,
        EventDocumentationModel.self,
        OtherDocumentationModel.self
    ]
}
