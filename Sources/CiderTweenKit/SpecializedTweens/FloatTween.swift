import Foundation

fileprivate func floatTweenTransformer(from: Float, to: Float, easedValue: Float) -> Float {
    from + (to - from) * easedValue
}

public extension Float {
    
    static func tween(from: Float, to: Float, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async -> (Tween, TweenData<Float>) {
        let data = TweenData(from: from, to: to, transformer: floatTweenTransformer(from:to:easedValue:))
        let tween = await Tween(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
        return (tween, data)
    }
    
}
