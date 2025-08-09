import Foundation

internal func doubleTweenTransformer(from: Double, to: Double, easedValue: Float) -> Double {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension Double {

    /// Create a tween between to `Double` values
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: Double, to: Double, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<Double> {
        let data = TweenData(from: from, to: to, transformer: doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd2doubleTweenTransformer(from: SIMD2<Double>, to: SIMD2<Double>, easedValue: Float) -> SIMD2<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD2<Double> {

    /// Create a tween between to `SIMD2<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD2<Double>, to: SIMD2<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD2<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd2doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd3doubleTweenTransformer(from: SIMD3<Double>, to: SIMD3<Double>, easedValue: Float) -> SIMD3<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD3<Double> {

    /// Create a tween between to `SIMD3<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD3<Double>, to: SIMD3<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD3<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd3doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd4doubleTweenTransformer(from: SIMD4<Double>, to: SIMD4<Double>, easedValue: Float) -> SIMD4<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD4<Double> {

    /// Create a tween between to `SIMD4<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD4<Double>, to: SIMD4<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD4<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd4doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd8doubleTweenTransformer(from: SIMD8<Double>, to: SIMD8<Double>, easedValue: Float) -> SIMD8<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD8<Double> {

    /// Create a tween between to `SIMD8<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD8<Double>, to: SIMD8<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD8<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd8doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd16doubleTweenTransformer(from: SIMD16<Double>, to: SIMD16<Double>, easedValue: Float) -> SIMD16<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD16<Double> {

    /// Create a tween between to `SIMD16<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD16<Double>, to: SIMD16<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD16<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd16doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd32doubleTweenTransformer(from: SIMD32<Double>, to: SIMD32<Double>, easedValue: Float) -> SIMD32<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD32<Double> {

    /// Create a tween between to `SIMD32<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD32<Double>, to: SIMD32<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD32<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd32doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}

internal func simd64doubleTweenTransformer(from: SIMD64<Double>, to: SIMD64<Double>, easedValue: Float) -> SIMD64<Double> {
    from + (to - from) * Double(easedValue)
}

/// Tween-specific extensions
public extension SIMD64<Double> {

    /// Create a tween between to `SIMD64<Double>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD64<Double>, to: SIMD64<Double>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD64<Double>> {
        let data = TweenData(from: from, to: to, transformer: simd64doubleTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}
