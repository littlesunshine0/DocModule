import Foundation

/// Shapes associated with each documentation content type.
public enum DocumentationShape: String, Codable, Sendable, CaseIterable {
    case roundedRectangle
    case circle
    case hexagon
    case square
    case diamond
    case capsule
    case rectangle
    case roundedSquare
    case octagon
    case stadium
    case pentagon
    case triangle
    
    /// Corner radius to use when rendering this shape.
    public var cornerRadius: Double {
        switch self {
        case .roundedRectangle: return 12.0
        case .circle: return .infinity
        case .hexagon: return 8.0
        case .square: return 0.0
        case .diamond: return 0.0
        case .capsule: return .infinity
        case .rectangle: return 0.0
        case .roundedSquare: return 8.0
        case .octagon: return 4.0
        case .stadium: return 20.0
        case .pentagon: return 0.0
        case .triangle: return 0.0
        }
    }
    
    /// Number of sides for polygon shapes.
    public var sides: Int {
        switch self {
        case .roundedRectangle: return 4
        case .circle: return 0
        case .hexagon: return 6
        case .square: return 4
        case .diamond: return 4
        case .capsule: return 0
        case .rectangle: return 4
        case .roundedSquare: return 4
        case .octagon: return 8
        case .stadium: return 0
        case .pentagon: return 5
        case .triangle: return 3
        }
    }
    
    /// SF Symbol name for shape representation.
    public var symbolName: String {
        switch self {
        case .roundedRectangle: return "rectangle.fill"
        case .circle: return "circle.fill"
        case .hexagon: return "hexagon.fill"
        case .square: return "square.fill"
        case .diamond: return "diamond.fill"
        case .capsule: return "capsule.fill"
        case .rectangle: return "rectangle.fill"
        case .roundedSquare: return "app.fill"
        case .octagon: return "octagon.fill"
        case .stadium: return "stadium.fill"
        case .pentagon: return "pentagon.fill"
        case .triangle: return "triangle.fill"
        }
    }
}
