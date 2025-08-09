import Foundation

internal func cgsizeTweenTransformer(from: CGSize, to: CGSize, easedValue: Float) -> CGSize {
    CGSize(
        width: cgfloatTweenTransformer(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenTransformer(from: from.height, to: to.height, easedValue: easedValue)
    )
}

/// Tween-specific extensions
public extension CGSize {

    /// Create a tween between to `CGSize` values
    ///
    /// The tween is applied independently to the `width` and `height` values of `CGSize`.
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: CGSize, to: CGSize, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGSize> {
        let data = TweenData(from: from, to: to, transformer: cgsizeTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}
