import Foundation

internal func uintTweenTransformer(from: UInt, to: UInt, easedValue: Float) -> UInt {
    let doubleFrom = Double(from)
    let doubleTo = Double(to)
    
    let result = doubleFrom + (doubleTo - doubleFrom) * Double(easedValue)
    return UInt(result.rounded(.towardZero))
}

public extension UInt {
    
    static func tween(from: UInt, to: UInt, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<UInt> {
        let data = TweenData(from: from, to: to, transformer: uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }
    
}

internal func simd2uintTweenTransformer(from: SIMD2<UInt>, to: SIMD2<UInt>, easedValue: Float) -> SIMD2<UInt> {
    let simdDoubleFrom = SIMD2<Double>(from)
    let simdDoubleTo = SIMD2<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD2<UInt>()
    for i in 0..<2 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD2<UInt> {

    static func tween(from: SIMD2<UInt>, to: SIMD2<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD2<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd2uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd3uintTweenTransformer(from: SIMD3<UInt>, to: SIMD3<UInt>, easedValue: Float) -> SIMD3<UInt> {
    let simdDoubleFrom = SIMD3<Double>(from)
    let simdDoubleTo = SIMD3<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD3<UInt>()
    for i in 0..<3 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD3<UInt> {

    static func tween(from: SIMD3<UInt>, to: SIMD3<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD3<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd3uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd4uintTweenTransformer(from: SIMD4<UInt>, to: SIMD4<UInt>, easedValue: Float) -> SIMD4<UInt> {
    let simdDoubleFrom = SIMD4<Double>(from)
    let simdDoubleTo = SIMD4<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD4<UInt>()
    for i in 0..<4 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD4<UInt> {

    static func tween(from: SIMD4<UInt>, to: SIMD4<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD4<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd4uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd8uintTweenTransformer(from: SIMD8<UInt>, to: SIMD8<UInt>, easedValue: Float) -> SIMD8<UInt> {
    let simdDoubleFrom = SIMD8<Double>(from)
    let simdDoubleTo = SIMD8<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD8<UInt>()
    for i in 0..<8 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD8<UInt> {

    static func tween(from: SIMD8<UInt>, to: SIMD8<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD8<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd8uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd16uintTweenTransformer(from: SIMD16<UInt>, to: SIMD16<UInt>, easedValue: Float) -> SIMD16<UInt> {
    let simdDoubleFrom = SIMD16<Double>(from)
    let simdDoubleTo = SIMD16<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD16<UInt>()
    for i in 0..<16 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD16<UInt> {

    static func tween(from: SIMD16<UInt>, to: SIMD16<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD16<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd16uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd32uintTweenTransformer(from: SIMD32<UInt>, to: SIMD32<UInt>, easedValue: Float) -> SIMD32<UInt> {
    let simdDoubleFrom = SIMD32<Double>(from)
    let simdDoubleTo = SIMD32<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD32<UInt>()
    for i in 0..<32 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD32<UInt> {

    static func tween(from: SIMD32<UInt>, to: SIMD32<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD32<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd32uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd64uintTweenTransformer(from: SIMD64<UInt>, to: SIMD64<UInt>, easedValue: Float) -> SIMD64<UInt> {
    let simdDoubleFrom = SIMD64<Double>(from)
    let simdDoubleTo = SIMD64<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD64<UInt>()
    for i in 0..<64 {
        simdResult[i] = UInt(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

public extension SIMD64<UInt> {

    static func tween(from: SIMD64<UInt>, to: SIMD64<UInt>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD64<UInt>> {
        let data = TweenData(from: from, to: to, transformer: simd64uintTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}
