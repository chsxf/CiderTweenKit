import Foundation

internal func cgfloatTweenTransformer(from: CGFloat, to: CGFloat, easedValue: Float) -> CGFloat {
    from + (to - from) * CGFloat(easedValue)
}

/// Tween-specific extensions
public extension CGFloat {

    /// Create a tween between to `CGFloat` values
    ///
    /// - Parameters:
    ///     - from: Starting value
    ///     - to: Ending value
    ///     - duration: Duration in seconds of the tween
    ///     - easing: ```Easing``` type to apply
    ///     - manualUpdate: If set, the tween won't be automatically updated and you will be responsible for calling the ```Tween/update(additionalElapsedTime:)``` method to make it progress
    static func tween(from: CGFloat, to: CGFloat, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGFloat> {
        let data = TweenData(from: from, to: to, transformer: cgfloatTweenTransformer(from:to:easedValue:))
        return await Tween(data: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }

}
