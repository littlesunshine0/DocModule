// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A comprehensive module for documentation content management.
///
/// ## Overview
///
/// DocumentationModule provides 12 content types, rich markdown extensions,
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

import Foundation
import SwiftData

// Re-export all public types
@_exported import struct Foundation.UUID
@_exported import struct Foundation.Date
@_exported import struct Foundation.Data
