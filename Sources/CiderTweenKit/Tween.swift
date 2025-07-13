import Foundation

public final class Tween<T: Sendable>: Tweenable {

    public typealias TransformerFunction = @Sendable (T, T, Float) -> T

    public let from: T
    public let to: T
    private var current: T

    public let duration: TimeInterval
    public let easing: Easing

    private let transformer: TransformerFunction

    private init(from: T, to: T, duration: TimeInterval, easing: Easing, transformer: @escaping TransformerFunction, manualUpdate: Bool = false) async {
        self.from = from
        self.to = to
        self.current = from

        self.duration = duration
        self.easing = easing

        self.transformer = transformer

        if !manualUpdate {
            let ref = self
            Task { @TweenManager in
                await TweenManager.shared.register(tweenable: ref)
            }
        }
    }

}
