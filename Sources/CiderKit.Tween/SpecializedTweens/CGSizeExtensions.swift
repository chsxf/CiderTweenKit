import Foundation

internal func cgsizeTweenTransformer(from: CGSize, to: CGSize, easedValue: Float) -> CGSize {
    CGSize(
        width: cgfloatTweenTransformer(from: from.width, to: to.width, easedValue: easedValue),
        height: cgfloatTweenTransformer(from: from.height, to: to.height, easedValue: easedValue)
    )
}

public extension CGSize {

    static func tween(from: CGSize, to: CGSize, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGSize> {
        let data = TweenData(from: from, to: to, transformer: cgsizeTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }
    
}
