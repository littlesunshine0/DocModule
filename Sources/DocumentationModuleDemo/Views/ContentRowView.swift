import SwiftUI
import DocumentationModule

/// A reusable row view for displaying content items with their visual identity.
struct ContentRowView: View {
    let icon: DocumentationIcon
    let color: DocumentationColor
    let shape: DocumentationShape
    let title: String
    let subtitle: String
    
    var swiftUIColor: Color {
        let rgb = color.rgbComponents
        return Color(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
    
    var body: some View {
        HStack(spacing: 12) {
            // Icon with shape background
            iconView
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private var iconView: some View {
        let iconImage = Image(systemName: icon.systemName)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 36, height: 36)
            .background(swiftUIColor)
        
        switch shape {
        case .roundedRectangle:
            iconImage.clipShape(RoundedRectangle(cornerRadius: shape.cornerRadius))
        case .circle:
            iconImage.clipShape(Circle())
        case .hexagon:
            iconImage.clipShape(RoundedRectangle(cornerRadius: 8))
        case .square, .rectangle:
            iconImage.clipShape(Rectangle())
        case .capsule, .stadium:
            iconImage.clipShape(Capsule())
        default:
            iconImage.clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    List {
        ContentRowView(
            icon: .guide,
            color: .guide,
            shape: .roundedRectangle,
            title: "Getting Started",
            subtitle: "3 steps • Getting Started"
        )
        ContentRowView(
            icon: .article,
            color: .article,
            shape: .circle,
            title: "What's New",
            subtitle: "swift, updates"
        )
        ContentRowView(
            icon: .tutorial,
            color: .tutorial,
            shape: .hexagon,
            title: "Build an App",
            subtitle: "Beginner • 30 min"
        )
        ContentRowView(
            icon: .reference,
            color: .reference,
            shape: .square,
            title: "GuideModel",
            subtitle: "API"
        )
    }
}
