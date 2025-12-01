// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A comprehensive module for documentation content management.
///
/// ## Overview
///
/// DocumentationModule provides 35 content types, rich markdown extensions,
/// animations, parsing, generation, and automation workflows.
///
/// ## Content Types
///
/// - ``GuideModel``: Step-by-step guides
/// - ``ArticleModel``: Long-form articles
/// - ``TutorialModel``: Interactive tutorials
/// - ``ReferenceModel``: API documentation
/// - ``ChangelogModel``: Version history
/// - ``FAQModel``: Frequently asked questions
/// - ``GlossaryModel``: Term definitions
/// - ``SnippetModel``: Code snippets
/// - ``DiagramModel``: Visual diagrams
/// - ``VideoModel``: Video content
/// - ``SampleModel``: Sample projects
/// - ``TroubleshootingModel``: Problem-solution guides
/// - ``CaseStudyModel``: Real-world success stories
/// - ``WhitepaperModel``: Research-grade deep dives
/// - ``IntegrationModel``: System and service integrations
/// - ``RoadmapModel``: Milestones and strategic themes
/// - ``UseCaseModel``: Value-driven scenarios
/// - ``PlaybookModel``: Repeatable operational procedures
/// - ``PolicyModel``: Standards and compliance rules
/// - ``ReadmeModel``: Project introductions and setup
/// - ``RequirementsModel``: Functional and non-functional needs
/// - ``TaskListModel``: Actionable checklists
/// - ``DesignDocModel``: Design rationale and decisions
/// - ``BlueprintModel``: Architecture blueprints
/// - ``GuideCollectionModel``: Curated bundles of guides
/// - ``FrameworkModel``: Methodologies and principles
/// - ``ResearchModel``: Experiments, data, and findings
/// - ``ViewDocumentationModel``: UI specifications and states
/// - ``ViewModelDocumentationModel``: Presentation logic contracts
/// - ``DataModelDocumentationModel``: Entity schemas and relationships
/// - ``ServiceDocumentationModel``: Service contracts and SLAs
/// - ``ManagerDocumentationModel``: Coordinator responsibilities
/// - ``CheckpointDocumentationModel``: Validation gates and criteria
/// - ``MilestoneDocumentationModel``: Major delivery goals
/// - ``EventDocumentationModel``: Domain triggers and payloads
/// - ``OtherDocumentationModel``: Miscellaneous documentation assets
///
/// ## Features
///
/// - Rich markdown extensions (callouts, tabs, badges, etc.)
/// - Animations and motion effects
/// - Content parsing and validation
/// - Multi-format generation (HTML, DocC, PDF, etc.)
/// - Automation workflows
/// - Commands and actions
/// - Comprehensive help system
/// - Taxonomy helpers to organize documentation by type, kind, and lifecycle category

import Foundation
import SwiftData

// Re-export all public types
@_exported import struct Foundation.UUID
@_exported import struct Foundation.Date
@_exported import struct Foundation.Data
