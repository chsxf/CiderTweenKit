import Foundation

internal func doubleTweenTransformer(from: Double, to: Double, easedValue: Float) -> Double {
    from + (to - from) * Double(easedValue)
}

public extension Double {

    static func tween(from: Double, to: Double, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<Double> {
        let data = TweenData(from: from, to: to, transformer: doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd2doubleTweenTransformer(from: SIMD2<Double>, to: SIMD2<Double>, easedValue: Float) -> SIMD2<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD2<Double> {

    static func tween(from: SIMD2<Double>, to: SIMD2<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD2<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd2doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd3doubleTweenTransformer(from: SIMD3<Double>, to: SIMD3<Double>, easedValue: Float) -> SIMD3<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD3<Double> {

    static func tween(from: SIMD3<Double>, to: SIMD3<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD3<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd3doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd4doubleTweenTransformer(from: SIMD4<Double>, to: SIMD4<Double>, easedValue: Float) -> SIMD4<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD4<Double> {

    static func tween(from: SIMD4<Double>, to: SIMD4<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD4<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd4doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd8doubleTweenTransformer(from: SIMD8<Double>, to: SIMD8<Double>, easedValue: Float) -> SIMD8<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD8<Double> {

    static func tween(from: SIMD8<Double>, to: SIMD8<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD8<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd8doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd16doubleTweenTransformer(from: SIMD16<Double>, to: SIMD16<Double>, easedValue: Float) -> SIMD16<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD16<Double> {

    static func tween(from: SIMD16<Double>, to: SIMD16<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD16<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd16doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd32doubleTweenTransformer(from: SIMD32<Double>, to: SIMD32<Double>, easedValue: Float) -> SIMD32<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD32<Double> {

    static func tween(from: SIMD32<Double>, to: SIMD32<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD32<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd32doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd64doubleTweenTransformer(from: SIMD64<Double>, to: SIMD64<Double>, easedValue: Float) -> SIMD64<Double> {
    from + (to - from) * Double(easedValue)
}

public extension SIMD64<Double> {

    static func tween(from: SIMD64<Double>, to: SIMD64<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD64<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd64doubleTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}
