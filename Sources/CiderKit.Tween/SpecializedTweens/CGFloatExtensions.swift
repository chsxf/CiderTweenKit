import Foundation

internal func cgfloatTweenTransformer(from: CGFloat, to: CGFloat, easedValue: Float) -> CGFloat {
    from + (to - from) * CGFloat(easedValue)
}

public extension CGFloat {
    
    static func tween(from: CGFloat, to: CGFloat, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> Tween<CGFloat> {
        let data = TweenData(from: from, to: to, transformer: cgfloatTweenTransformer(from:to:easedValue:))
        let instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return Tween(instance, data)
    }
    
}
