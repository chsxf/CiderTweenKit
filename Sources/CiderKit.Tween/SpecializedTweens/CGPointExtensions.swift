import Foundation

internal func cgpointTweenTransformer(from: CGPoint, to: CGPoint, easedValue: Float) -> CGPoint {
    CGPoint(
        x: cgfloatTweenTransformer(from: from.x, to: to.x, easedValue: easedValue),
        y: cgfloatTweenTransformer(from: from.y, to: to.y, easedValue: easedValue)
    )
}

public extension CGPoint {

    static func tween(from: CGPoint, to: CGPoint, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGPoint> {
        let data = TweenData(from: from, to: to, transformer: cgpointTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }

}
