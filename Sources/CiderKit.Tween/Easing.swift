import Foundation

public enum Easing: CaseIterable, Sendable, Codable, CustomStringConvertible {

    public static let allCases: [Easing] = [
        .inSine, .outSine, .inOutSine,
        .inCubic, .outCubic, .inOutCubic,
        .inQuint, .outQuint, .inOutQuint,
        .inCirc, .outCirc, .inOutCirc,
        .inElastic, .outElastic, .inOutElastic,
        .inQuad, .outQuad, .inOutQuad,
        .inQuart, .outQuart, .inOutQuart,
        .inExpo, .outExpo, .inOutExpo,
        .inBack, .outBack, .inOutBack,
        .inBounce, .outBounce, .inOutBounce,
        .linear
    ]

    case inSine
    case outSine
    case inOutSine

    case inCubic
    case outCubic
    case inOutCubic

    case inQuint
    case outQuint
    case inOutQuint

    case inCirc
    case outCirc
    case inOutCirc

    case inElastic
    case outElastic
    case inOutElastic

    case inQuad
    case outQuad
    case inOutQuad

    case inQuart
    case outQuart
    case inOutQuart

    case inExpo
    case outExpo
    case inOutExpo

    case inBack
    case outBack
    case inOutBack

    case inBounce
    case outBounce
    case inOutBounce

    case linear
    case custom(_ easingFunction: EasingFunction, _ description: String = "Custom")

    public init(from decoder: any Decoder) throws {
        let singleValueContainer = try decoder.singleValueContainer()
        let easingDescription = try singleValueContainer.decode(String.self)
        guard let easing = descriptionToEasingMap[easingDescription] else {
            throw EasingError.unknownEncodedEasing
        }
        self = easing
    }

    public func encode(to encoder: any Encoder) throws {
        if case .custom(_, _) = self {
            throw EasingError.encodingCustom
        }

        var singleValueContainer = encoder.singleValueContainer()
        try singleValueContainer.encode(description)
    }

    public var description: String {
        switch self {
            case .inSine: return "In Sine"
            case .outSine: return "Out Sine"
            case .inOutSine: return "In Out Sine"

            case .inCubic: return "In Cubic"
            case .outCubic: return "Out Cubic"
            case .inOutCubic: return "In Out Cubic"

            case .inQuint: return "In Quint"
            case .outQuint: return "Out Quint"
            case .inOutQuint: return "In Out Quint"

            case .inCirc: return "In Circ"
            case .outCirc: return "Out Circ"
            case .inOutCirc: return "In Out Circ"

            case .inElastic: return "In Elastic"
            case .outElastic: return "Out Elastic"
            case .inOutElastic: return "In Out Elastic"

            case .inQuad: return "In Quad"
            case .outQuad: return "Out Quad"
            case .inOutQuad: return "In Out Quad"

            case .inQuart: return "In Quart"
            case .outQuart: return "Out Quart"
            case .inOutQuart: return "In Out Quart"

            case .inExpo: return "In Expo"
            case .outExpo: return "Out Expo"
            case .inOutExpo: return "In Out Expo"

            case .inBack: return "In Back"
            case .outBack: return "Out Back"
            case .inOutBack: return "In Out Back"

            case .inBounce: return "In Bounce"
            case .outBounce: return "Out Bounce"
            case .inOutBounce: return "In Out Bounce"

            case .linear: return "Linear"
            case .custom(_, let description): return description
        }
    }

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

            case .custom(let easingFunction, _): easingFunction
            default: EasingFunctions.linear
        }
    }

}

fileprivate let descriptionToEasingMap: [String: Easing] = [
    "In Sine": .inSine,
    "Out Sine": .outSine,
    "In Out Sine": .inOutSine,

    "In Cubic": .inCubic,
    "Out Cubic": .outCubic,
    "In Out Cubic": .inOutCubic,

    "In Quint": .inQuint,
    "Out Quint": .outQuint,
    "In Out Quint": .inOutQuint,

    "In Circ": .inCirc,
    "Out Circ": .outCirc,
    "In Out Circ": .inOutCirc,

    "In Elastic": .inElastic,
    "Out Elastic": .outElastic,
    "In Out Elastic": .inOutElastic,

    "In Quad": .inQuad,
    "Out Quad": .outQuad,
    "In Out Quad": .inOutQuad,

    "In Quart": .inQuart,
    "Out Quart": .outQuart,
    "In Out Quart": .inOutQuart,

    "In Expo": .inExpo,
    "Out Expo": .outExpo,
    "In Out Expo": .inOutExpo,

    "In Back": .inBack,
    "Out Back": .outBack,
    "In Out Back": .inOutBack,

    "In Bounce": .inBounce,
    "Out Bounce": .outBounce,
    "In Out Bounce": .inOutBounce,

    "Linear": .linear
]
