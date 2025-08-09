import Foundation

internal func cgrectTweenInterpolator(from: CGRect, to: CGRect, easedValue: Float) -> CGRect {
    CGRect(
        x: cgfloatTweenInterpolator(from: from.minX, to: to.minX, easedValue: easedValue),
        y: cgfloatTweenInterpolator(from: from.minY, to: to.minY, easedValue: easedValue),
        width: cgfloatTweenInterpolator(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenInterpolator(from: from.height, to: to.height, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGRect {

    /// Create a tween between two `CGRect` values
    ///
    /// The tween is applied independently to the `minX`, `minY`, `width`, and `height` values of `CGRect`.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: CGRect, to: CGRect, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGRect> {
        let data = TweenData(from: from, to: to, interpolator: cgrectTweenInterpolator(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}
