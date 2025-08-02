import Foundation

internal func intTweenTransformer(from: Int, to: Int, easedValue: Float) -> Int {
    let doubleFrom = Double(from)
    let doubleTo = Double(to)

    let result = doubleFrom + (doubleTo - doubleFrom) * Double(easedValue)
    return Int(result.rounded(.towardZero))
}

/// Tween-specific extensions
public extension Int {

    /// Create a tween between to `Int` values
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: Int, to: Int, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<Int> {
        let data = TweenData(from: from, to: to, transformer: intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd2intTweenTransformer(from: SIMD2<Int>, to: SIMD2<Int>, easedValue: Float) -> SIMD2<Int> {
    let simdDoubleFrom = SIMD2<Double>(from)
    let simdDoubleTo = SIMD2<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD2<Int>()
    for i in 0..<2 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD2<Int> {

    /// Create a tween between to `SIMD2<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD2<Int>, to: SIMD2<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD2<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd2intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd3intTweenTransformer(from: SIMD3<Int>, to: SIMD3<Int>, easedValue: Float) -> SIMD3<Int> {
    let simdDoubleFrom = SIMD3<Double>(from)
    let simdDoubleTo = SIMD3<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD3<Int>()
    for i in 0..<3 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD3<Int> {

    /// Create a tween between to `SIMD3<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD3<Int>, to: SIMD3<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD3<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd3intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd4intTweenTransformer(from: SIMD4<Int>, to: SIMD4<Int>, easedValue: Float) -> SIMD4<Int> {
    let simdDoubleFrom = SIMD4<Double>(from)
    let simdDoubleTo = SIMD4<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD4<Int>()
    for i in 0..<4 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD4<Int> {

    /// Create a tween between to `SIMD4<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD4<Int>, to: SIMD4<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD4<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd4intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd8intTweenTransformer(from: SIMD8<Int>, to: SIMD8<Int>, easedValue: Float) -> SIMD8<Int> {
    let simdDoubleFrom = SIMD8<Double>(from)
    let simdDoubleTo = SIMD8<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD8<Int>()
    for i in 0..<8 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD8<Int> {

    /// Create a tween between to `SIMD8<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD8<Int>, to: SIMD8<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD8<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd8intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd16intTweenTransformer(from: SIMD16<Int>, to: SIMD16<Int>, easedValue: Float) -> SIMD16<Int> {
    let simdDoubleFrom = SIMD16<Double>(from)
    let simdDoubleTo = SIMD16<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD16<Int>()
    for i in 0..<16 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD16<Int> {

    /// Create a tween between to `SIMD16<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD16<Int>, to: SIMD16<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD16<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd16intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd32intTweenTransformer(from: SIMD32<Int>, to: SIMD32<Int>, easedValue: Float) -> SIMD32<Int> {
    let simdDoubleFrom = SIMD32<Double>(from)
    let simdDoubleTo = SIMD32<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD32<Int>()
    for i in 0..<32 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD32<Int> {

    /// Create a tween between to `SIMD32<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD32<Int>, to: SIMD32<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD32<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd32intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd64intTweenTransformer(from: SIMD64<Int>, to: SIMD64<Int>, easedValue: Float) -> SIMD64<Int> {
    let simdDoubleFrom = SIMD64<Double>(from)
    let simdDoubleTo = SIMD64<Double>(to)
    let simdDoubleResult = (simdDoubleTo - simdDoubleFrom) * Double(easedValue)
    var simdResult = SIMD64<Int>()
    for i in 0..<64 {
        simdResult[i] = Int(simdDoubleResult[i].rounded(.towardZero))
    }
    return simdResult
}

/// Tween-specific extensions
public extension SIMD64<Int> {

    /// Create a tween between to `SIMD64<Int>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD64<Int>, to: SIMD64<Int>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD64<Int>> {
        let data = TweenData(from: from, to: to, transformer: simd64intTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}
