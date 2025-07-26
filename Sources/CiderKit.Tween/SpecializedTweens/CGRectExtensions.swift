import Foundation

internal func cgrectTweenTransformer(from: CGRect, to: CGRect, easedValue: Float) -> CGRect {
    CGRect(
        x: cgfloatTweenTransformer(from: from.minX, to: to.minX, easedValue: easedValue),
        y: cgfloatTweenTransformer(from: from.minY, to: to.minY, easedValue: easedValue),
        width: cgfloatTweenTransformer(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenTransformer(from: from.height, to: to.height, easedValue: easedValue)
    )
}

public extension CGRect {

    static func tween(from: CGRect, to: CGRect, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGRect> {
        let data = TweenData(from: from, to: to, transformer: cgrectTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }
    
}
