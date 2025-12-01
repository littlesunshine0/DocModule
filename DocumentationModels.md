# Documentation Models Catalog

This catalog lists every documentation-focused SwiftData model shipped in the package so you can ensure your DocC catalog or Markdown references include at least one of each type.

## Core Content Types
- **ArticleModel** — Long-form articles with authorship, tags, and categorized body copy.
- **GuideModel** — Step-by-step guides that can include ordered guide steps and taxonomy metadata.
- **TutorialModel** — Interactive tutorials with difficulty, estimated time, and tutorial steps.
- **ReferenceModel** — API or type references that can embed related APIs and code examples.
- **GuideCollectionModel** — Curated collections of multiple guides maintained by a curator.
- **SnippetModel** — Short code snippets with language and formatting metadata.
- **SampleModel** — Sample projects or assets that bundle files and supporting references.
- **VideoModel** — Videos with chapters, durations, and supporting resources.
- **DiagramModel** — Visual diagrams composed of nodes, edges, and captions.

## Knowledge & Discovery
- **GlossaryModel** — Term definitions for quick lookup across the documentation set.
- **FAQModel** — Frequently asked questions paired with concise answers and related links.
- **CaseStudyModel** — Narrative case studies highlighting outcomes and lessons learned.
- **ResearchModel** — Research summaries with findings, sources, and key takeaways.
- **WhitepaperModel** — Formal whitepapers that outline problems, approaches, and conclusions.
- **EventDocumentationModel** — Notes and outcomes from launches, workshops, or other events.
- **OtherDocumentationModel** — A flexible catch-all for documentation that does not fit standard molds.

## Planning & Delivery
- **RoadmapModel** — Product or platform roadmaps with phases, owners, and dependencies.
- **MilestoneDocumentationModel** — Milestone summaries tracking goals, criteria, and completion states.
- **CheckpointDocumentationModel** — In-flight checkpoint reports for projects or programs.
- **TaskListModel** — Task breakdowns with ordering, status, and assignments.
- **RequirementsModel** — Requirement sets capturing constraints, acceptance criteria, and priorities.
- **UseCaseModel** — Use cases capturing actors, flows, and success conditions.
- **PolicyModel** — Policies covering governance, compliance, or operational rules.
- **PlaybookModel** — Repeatable playbooks for handling scenarios with ready-made checklists.
- **ManagerDocumentationModel** — Management-facing briefs with updates, risks, and staffing notes.

## Architecture & Implementation
- **BlueprintModel** — Architecture blueprints summarizing components, integrations, and risks.
- **DesignDocModel** — Design documents capturing proposals, trade-offs, and decisions.
- **DataModelDocumentationModel** — Data model documentation listing entities, relationships, and constraints.
- **IntegrationModel** — Integration specs outlining external systems and contract expectations.
- **FrameworkModel** — Framework or SDK documentation with module boundaries and dependencies.
- **ServiceDocumentationModel** — Service runbooks or docs with SLOs, endpoints, and operational notes.
- **ViewDocumentationModel** — UI view documentation describing layout, state, and behaviors.
- **ViewModelDocumentationModel** — View model docs capturing inputs, outputs, and state orchestration.

## Support & Maintenance
- **ChangelogModel** — Changelogs cataloging releases, versions, and notable changes.
- **TroubleshootingModel** — Troubleshooting guides mapping problems to solutions.
- **ReadmeModel** — README-style overviews for repositories, packages, or components.

Each type above is backed by a SwiftData model in `Sources/DocumentationModule/Models` (or the module root for the core content types) so you can seed, query, and render a complete knowledge base.
