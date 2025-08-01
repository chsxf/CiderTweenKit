import Foundation

public enum Easing: String, CaseIterable, Sendable {

    case inSine = "In Sine"
    case outSine = "Out Sine"
    case inOutSine = "In Out Sine"

    case inCubic = "In Cubic"
    case outCubic = "Out Cubic"
    case inOutCubic = "In Out Cubic"

    case inQuint = "In Quint"
    case outQuint = "Out Quint"
    case inOutQuint = "In Out Quint"

    case inCirc = "In Circ"
    case outCirc = "Out Circ"
    case inOutCirc = "In Out Circ"

    case inElastic = "In Elastic"
    case outElastic = "Out Elastic"
    case inOutElastic = "In Out Elastic"

    case inQuad = "In Quad"
    case outQuad = "Out Quad"
    case inOutQuad = "In Out Quad"

    case inQuart = "In Quart"
    case outQuart = "Out Quart"
    case inOutQuart = "In Out Quart"

    case inExpo = "In Expo"
    case outExpo = "Out Expo"
    case inOutExpo = "In Out Expo"

    case inBack = "In Back"
    case outBack = "Out Back"
    case inOutBack = "In Out Back"

    case inBounce = "In Bounce"
    case outBounce = "Out Bounce"
    case inOutBounce = "In Out Bounce"

    case linear = "Linear"
    case custom = "Custom"

}

internal extension Easing {

    func easingFunction() -> EasingFunction {
        switch self {
            case .inSine: EasingFunctions.inSine
            case .outSine: EasingFunctions.outSine
            case .inOutSine: EasingFunctions.inOutSine

            case .inCubic: EasingFunctions.inCubic
            case .outCubic: EasingFunctions.outCubic
            case .inOutCubic: EasingFunctions.inOutCubic

            case .inQuint: EasingFunctions.inQuint
            case .outQuint: EasingFunctions.outQuint
            case .inOutQuint: EasingFunctions.inOutQuint

            case .inCirc: EasingFunctions.inCirc
            case .outCirc: EasingFunctions.outCirc
            case .inOutCirc: EasingFunctions.inOutCirc

            case .inElastic: EasingFunctions.inElastic
            case .outElastic: EasingFunctions.outElastic
            case .inOutElastic: EasingFunctions.inOutElastic

            case .inQuad: EasingFunctions.inQuad
            case .outQuad: EasingFunctions.outQuad
            case .inOutQuad: EasingFunctions.inOutQuad

            case .inQuart: EasingFunctions.inQuart
            case .outQuart: EasingFunctions.outQuart
            case .inOutQuart: EasingFunctions.inOutQuart

            case .inExpo: EasingFunctions.inExpo
            case .outExpo: EasingFunctions.outExpo
            case .inOutExpo: EasingFunctions.inOutExpo

            case .inBack: EasingFunctions.inBack
            case .outBack: EasingFunctions.outBack
            case .inOutBack: EasingFunctions.inOutBack

            case .inBounce: EasingFunctions.inBounce
            case .outBounce: EasingFunctions.outBounce
            case .inOutBounce: EasingFunctions.inOutBounce

            default: EasingFunctions.linear
        }
    }

}
