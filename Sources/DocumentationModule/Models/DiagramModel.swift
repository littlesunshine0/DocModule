import Foundation
import SwiftData

/// Types of diagrams supported.
public enum DiagramType: String, Codable, Sendable, CaseIterable {
    case flowchart
    case sequence
    case classDiagram
    case stateDiagram
    case entityRelationship
    case mindMap
    case gantt
    case pie
    case architecture
    case network
    
    public var displayName: String {
        switch self {
        case .flowchart: return "Flowchart"
        case .sequence: return "Sequence Diagram"
        case .classDiagram: return "Class Diagram"
        case .stateDiagram: return "State Diagram"
        case .entityRelationship: return "ER Diagram"
        case .mindMap: return "Mind Map"
        case .gantt: return "Gantt Chart"
        case .pie: return "Pie Chart"
        case .architecture: return "Architecture Diagram"
        case .network: return "Network Diagram"
        }
    }
    
    public var mermaidPrefix: String {
        switch self {
        case .flowchart: return "flowchart"
        case .sequence: return "sequenceDiagram"
        case .classDiagram: return "classDiagram"
        case .stateDiagram: return "stateDiagram-v2"
        case .entityRelationship: return "erDiagram"
        case .mindMap: return "mindmap"
        case .gantt: return "gantt"
        case .pie: return "pie"
        case .architecture: return "flowchart"
        case .network: return "flowchart"
        }
    }
}

/// A node in a diagram.
public struct DiagramNode: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var label: String
    public var type: String
    public var x: Double
    public var y: Double
    public var width: Double
    public var height: Double
    public var style: [String: String]
    
    public init(
        id: UUID = UUID(),
        label: String,
        type: String = "default",
        x: Double = 0,
        y: Double = 0,
        width: Double = 100,
        height: Double = 50,
        style: [String: String] = [:]
    ) {
        self.id = id
        self.label = label
        self.type = type
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.style = style
    }
}

/// A connection between diagram nodes.
public struct DiagramEdge: Codable, Sendable, Equatable, Identifiable {
    public var id: UUID
    public var sourceID: UUID
    public var targetID: UUID
    public var label: String?
    public var style: String
    
    public init(
        id: UUID = UUID(),
        sourceID: UUID,
        targetID: UUID,
        label: String? = nil,
        style: String = "solid"
    ) {
        self.id = id
        self.sourceID = sourceID
        self.targetID = targetID
        self.label = label
        self.style = style
    }
}

/// A SwiftData model representing a visual diagram.
@Model
public final class DiagramModel {
    public var id: UUID
    public var title: String
    public var summary: String
    public var diagramType: DiagramType
    public var nodesData: Data
    public var edgesData: Data
    public var mermaidCode: String
    public var category: ContentCategory
    public var icon: DocumentationIcon
    public var createdAt: Date
    public var updatedAt: Date
    public var userID: String
    public var isPublished: Bool
    public var viewCount: Int
    
    public static let color = DocumentationColor.diagram
    public static let shape = DocumentationShape.octagon
    
    public var nodes: [DiagramNode] {
        get { (try? JSONDecoder().decode([DiagramNode].self, from: nodesData)) ?? [] }
        set { nodesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public var edges: [DiagramEdge] {
        get { (try? JSONDecoder().decode([DiagramEdge].self, from: edgesData)) ?? [] }
        set { edgesData = (try? JSONEncoder().encode(newValue)) ?? Data() }
    }
    
    public init(
        id: UUID = UUID(),
        title: String,
        summary: String = "",
        diagramType: DiagramType = .flowchart,
        nodes: [DiagramNode] = [],
        edges: [DiagramEdge] = [],
        mermaidCode: String = "",
        category: ContentCategory = .fundamentals,
        icon: DocumentationIcon = .diagram,
        createdAt: Date = Date(),
        updatedAt: Date = Date(),
        userID: String = "",
        isPublished: Bool = false,
        viewCount: Int = 0
    ) {
        self.id = id
        self.title = title
        self.summary = summary
        self.diagramType = diagramType
        self.nodesData = (try? JSONEncoder().encode(nodes)) ?? Data()
        self.edgesData = (try? JSONEncoder().encode(edges)) ?? Data()
        self.mermaidCode = mermaidCode
        self.category = category
        self.icon = icon
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.userID = userID
        self.isPublished = isPublished
        self.viewCount = viewCount
    }
}
