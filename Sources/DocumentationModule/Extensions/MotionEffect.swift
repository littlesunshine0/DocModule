import Foundation

/// Motion effects for interactive documentation elements.
public enum MotionEffect: String, Codable, Sendable, CaseIterable {
    case tilt3D
    case magneticHover
    case ripple
    case glow
    case spotlight
    case morphCursor
    case elasticDrag
    case particleTrail
    case waveDistortion
    case depthShift
    
    public var displayName: String {
        switch self {
        case .tilt3D: return "3D Tilt"
        case .magneticHover: return "Magnetic Hover"
        case .ripple: return "Ripple"
        case .glow: return "Glow"
        case .spotlight: return "Spotlight"
        case .morphCursor: return "Morph Cursor"
        case .elasticDrag: return "Elastic Drag"
        case .particleTrail: return "Particle Trail"
        case .waveDistortion: return "Wave Distortion"
        case .depthShift: return "Depth Shift"
        }
    }
    
    public var description: String {
        switch self {
        case .tilt3D: return "Element tilts based on cursor position"
        case .magneticHover: return "Element is attracted to cursor"
        case .ripple: return "Ripple effect on interaction"
        case .glow: return "Glowing effect following cursor"
        case .spotlight: return "Spotlight follows cursor"
        case .morphCursor: return "Cursor changes shape over element"
        case .elasticDrag: return "Elastic drag and release"
        case .particleTrail: return "Particles follow cursor"
        case .waveDistortion: return "Wave distortion on hover"
        case .depthShift: return "Parallax depth effect"
        }
    }
    
    public var requiresJS: Bool {
        switch self {
        case .tilt3D, .magneticHover, .spotlight, .morphCursor, .elasticDrag, .particleTrail, .waveDistortion, .depthShift:
            return true
        case .ripple, .glow:
            return false
        }
    }
}

/// Configuration for motion effects.
public struct MotionConfig: Codable, Sendable, Equatable {
    public var effect: MotionEffect
    public var intensity: Double
    public var smoothing: Double
    public var perspective: Double
    public var isEnabled: Bool
    public var respectsReducedMotion: Bool
    
    public init(
        effect: MotionEffect,
        intensity: Double = 1.0,
        smoothing: Double = 0.1,
        perspective: Double = 1000,
        isEnabled: Bool = true,
        respectsReducedMotion: Bool = true
    ) {
        self.effect = effect
        self.intensity = intensity
        self.smoothing = smoothing
        self.perspective = perspective
        self.isEnabled = isEnabled
        self.respectsReducedMotion = respectsReducedMotion
    }
}

/// Transition effects between documentation pages/sections.
public enum TransitionEffect: String, Codable, Sendable, CaseIterable {
    case crossfade
    case slideHorizontal
    case slideVertical
    case zoom
    case flip
    case cube
    case fold
    case iris
    case morph
    case sharedElement
    
    public var displayName: String {
        switch self {
        case .crossfade: return "Crossfade"
        case .slideHorizontal: return "Slide Horizontal"
        case .slideVertical: return "Slide Vertical"
        case .zoom: return "Zoom"
        case .flip: return "Flip"
        case .cube: return "Cube"
        case .fold: return "Fold"
        case .iris: return "Iris"
        case .morph: return "Morph"
        case .sharedElement: return "Shared Element"
        }
    }
    
    public var defaultDuration: Double {
        switch self {
        case .crossfade: return 0.3
        case .slideHorizontal, .slideVertical: return 0.4
        case .zoom: return 0.35
        case .flip, .cube, .fold: return 0.5
        case .iris: return 0.4
        case .morph, .sharedElement: return 0.45
        }
    }
}

/// Scroll-based animation configuration.
public struct ScrollAnimation: Codable, Sendable, Equatable {
    public var animation: AnimationType
    public var startOffset: Double
    public var endOffset: Double
    public var scrub: Bool
    public var pin: Bool
    public var markers: Bool
    
    public init(
        animation: AnimationType,
        startOffset: Double = 0,
        endOffset: Double = 1,
        scrub: Bool = true,
        pin: Bool = false,
        markers: Bool = false
    ) {
        self.animation = animation
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.scrub = scrub
        self.pin = pin
        self.markers = markers
    }
}
