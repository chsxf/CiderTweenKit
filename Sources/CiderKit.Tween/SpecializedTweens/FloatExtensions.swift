import Foundation

internal func floatTweenTransformer(from: Float, to: Float, easedValue: Float) -> Float {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension Float {

    /// Create a tween between to `Float` values
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: Float, to: Float, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<Float> {
        let data = TweenData(from: from, to: to, transformer: floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd2floatTweenTransformer(from: SIMD2<Float>, to: SIMD2<Float>, easedValue: Float) -> SIMD2<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD2<Float> {

    /// Create a tween between to `SIMD2<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD2<Float>, to: SIMD2<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD2<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd2floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd3floatTweenTransformer(from: SIMD3<Float>, to: SIMD3<Float>, easedValue: Float) -> SIMD3<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD3<Float> {

    /// Create a tween between to `SIMD3<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD3<Float>, to: SIMD3<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD3<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd3floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd4floatTweenTransformer(from: SIMD4<Float>, to: SIMD4<Float>, easedValue: Float) -> SIMD4<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD4<Float> {

    /// Create a tween between to `SIMD4<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD4<Float>, to: SIMD4<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD4<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd4floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd8floatTweenTransformer(from: SIMD8<Float>, to: SIMD8<Float>, easedValue: Float) -> SIMD8<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD8<Float> {

    /// Create a tween between to `SIMD8<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD8<Float>, to: SIMD8<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD8<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd8floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd16floatTweenTransformer(from: SIMD16<Float>, to: SIMD16<Float>, easedValue: Float) -> SIMD16<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD16<Float> {

    /// Create a tween between to `SIMD16<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD16<Float>, to: SIMD16<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD16<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd16floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd32floatTweenTransformer(from: SIMD32<Float>, to: SIMD32<Float>, easedValue: Float) -> SIMD32<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD32<Float> {

    /// Create a tween between to `SIMD32<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD32<Float>, to: SIMD32<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD32<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd32floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}

internal func simd64floatTweenTransformer(from: SIMD64<Float>, to: SIMD64<Float>, easedValue: Float) -> SIMD64<Float> {
    from + (to - from) * easedValue
}

/// Tween-specific extensions
public extension SIMD64<Float> {

    /// Create a tween between to `SIMD64<Float>` values
    ///
    /// The tween is applied independently to all elements of the SIMD vector.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: SIMD64<Float>, to: SIMD64<Float>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<SIMD64<Float>> {
        let data = TweenData(from: from, to: to, transformer: simd64floatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}
