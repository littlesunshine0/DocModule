import Foundation

/// Animation types for documentation UI elements.
public enum AnimationType: String, Codable, Sendable, CaseIterable {
    case fadeIn
    case fadeOut
    case slideUp
    case slideDown
    case slideLeft
    case slideRight
    case scaleIn
    case scaleOut
    case bounce
    case shake
    case pulse
    case spin
    case flip
    case morph
    case typewriter
    case highlight
    case reveal
    case parallax
    
    public var displayName: String {
        switch self {
        case .fadeIn: return "Fade In"
        case .fadeOut: return "Fade Out"
        case .slideUp: return "Slide Up"
        case .slideDown: return "Slide Down"
        case .slideLeft: return "Slide Left"
        case .slideRight: return "Slide Right"
        case .scaleIn: return "Scale In"
        case .scaleOut: return "Scale Out"
        case .bounce: return "Bounce"
        case .shake: return "Shake"
        case .pulse: return "Pulse"
        case .spin: return "Spin"
        case .flip: return "Flip"
        case .morph: return "Morph"
        case .typewriter: return "Typewriter"
        case .highlight: return "Highlight"
        case .reveal: return "Reveal"
        case .parallax: return "Parallax"
        }
    }
    
    public var defaultDuration: Double {
        switch self {
        case .fadeIn, .fadeOut: return 0.3
        case .slideUp, .slideDown, .slideLeft, .slideRight: return 0.4
        case .scaleIn, .scaleOut: return 0.3
        case .bounce: return 0.6
        case .shake: return 0.5
        case .pulse: return 1.0
        case .spin: return 1.0
        case .flip: return 0.6
        case .morph: return 0.5
        case .typewriter: return 2.0
        case .highlight: return 0.8
        case .reveal: return 0.5
        case .parallax: return 0.0
        }
    }
    
    public var cssKeyframes: String {
        switch self {
        case .fadeIn:
            return "@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }"
        case .fadeOut:
            return "@keyframes fadeOut { from { opacity: 1; } to { opacity: 0; } }"
        case .slideUp:
            return "@keyframes slideUp { from { transform: translateY(20px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }"
        case .slideDown:
            return "@keyframes slideDown { from { transform: translateY(-20px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }"
        case .slideLeft:
            return "@keyframes slideLeft { from { transform: translateX(20px); opacity: 0; } to { transform: translateX(0); opacity: 1; } }"
        case .slideRight:
            return "@keyframes slideRight { from { transform: translateX(-20px); opacity: 0; } to { transform: translateX(0); opacity: 1; } }"
        case .scaleIn:
            return "@keyframes scaleIn { from { transform: scale(0.8); opacity: 0; } to { transform: scale(1); opacity: 1; } }"
        case .scaleOut:
            return "@keyframes scaleOut { from { transform: scale(1); opacity: 1; } to { transform: scale(0.8); opacity: 0; } }"
        case .bounce:
            return "@keyframes bounce { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-10px); } }"
        case .shake:
            return "@keyframes shake { 0%, 100% { transform: translateX(0); } 25% { transform: translateX(-5px); } 75% { transform: translateX(5px); } }"
        case .pulse:
            return "@keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.5; } }"
        case .spin:
            return "@keyframes spin { from { transform: rotate(0deg); } to { transform: rotate(360deg); } }"
        case .flip:
            return "@keyframes flip { from { transform: rotateY(0); } to { transform: rotateY(180deg); } }"
        case .morph:
            return "@keyframes morph { 0%, 100% { border-radius: 50%; } 50% { border-radius: 0; } }"
        case .typewriter:
            return "@keyframes typewriter { from { width: 0; } to { width: 100%; } }"
        case .highlight:
            return "@keyframes highlight { 0% { background-position: -100%; } 100% { background-position: 200%; } }"
        case .reveal:
            return "@keyframes reveal { from { clip-path: inset(0 100% 0 0); } to { clip-path: inset(0 0 0 0); } }"
        case .parallax:
            return "/* Parallax is scroll-based, no keyframes */"
        }
    }
}

/// Animation configuration for documentation elements.
public struct AnimationConfig: Codable, Sendable, Equatable {
    public var type: AnimationType
    public var duration: Double
    public var delay: Double
    public var easing: AnimationEasing
    public var iterations: Int
    public var direction: AnimationDirection
    public var fillMode: AnimationFillMode
    public var trigger: AnimationTrigger
    
    public init(
        type: AnimationType,
        duration: Double? = nil,
        delay: Double = 0,
        easing: AnimationEasing = .easeInOut,
        iterations: Int = 1,
        direction: AnimationDirection = .normal,
        fillMode: AnimationFillMode = .forwards,
        trigger: AnimationTrigger = .onAppear
    ) {
        self.type = type
        self.duration = duration ?? type.defaultDuration
        self.delay = delay
        self.easing = easing
        self.iterations = iterations
        self.direction = direction
        self.fillMode = fillMode
        self.trigger = trigger
    }
    
    public var cssValue: String {
        "\(type.rawValue) \(duration)s \(easing.cssValue) \(delay)s \(iterations == -1 ? "infinite" : "\(iterations)") \(direction.rawValue) \(fillMode.rawValue)"
    }
}

public enum AnimationEasing: String, Codable, Sendable {
    case linear, easeIn, easeOut, easeInOut, spring
    
    public var cssValue: String {
        switch self {
        case .linear: return "linear"
        case .easeIn: return "ease-in"
        case .easeOut: return "ease-out"
        case .easeInOut: return "ease-in-out"
        case .spring: return "cubic-bezier(0.68, -0.55, 0.265, 1.55)"
        }
    }
}

public enum AnimationDirection: String, Codable, Sendable {
    case normal, reverse, alternate, alternateReverse = "alternate-reverse"
}

public enum AnimationFillMode: String, Codable, Sendable {
    case none, forwards, backwards, both
}

public enum AnimationTrigger: String, Codable, Sendable {
    case onAppear, onScroll, onHover, onClick, onFocus, manual
}
