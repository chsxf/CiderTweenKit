import Foundation

/// Represents data and transformation method for a ```Tween```
public struct TweenData<T: Sendable> {

    /// Function that describes the interpolation method
    ///
    /// > Warning: It is not mandatory for `easedValue` to be contained between 0 and 1.
    /// > It is your responsibility to check for these boundaries if your interpolation function requires a clamped value.
    ///
    /// - Parameters:
    ///     - from: Start value of the tween
    ///     - to: End value of the tween
    ///     - easedValue: Value that has been transformed by an ```EasingFunction``` and that indicates the amount of interpolation that needs to be done
    public typealias InterpolatorFunction = @Sendable (_ from: T, _ to: T, _ easedValue: Float) -> T

    /// Start value
    public let from: T
    /// End value
    public let to: T
    internal let transformer: TransformerFunction

    private let onStartContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the tween starts
    ///
    /// > Warning: You have to await for this `AsyncStream` values before the tween has started to receive values
    public let onStart: AsyncStream<Void>

    private let onUpdateContinuation: AsyncStream<T>.Continuation
    /// This `AsyncStream` will produce one value every time the tween progresses
    public let onUpdate: AsyncStream<T>

    private let onCompletionContinuation: AsyncStream<Void>.Continuation
    /// This `AsyncStream` will produce one `Void` value when the tween completes
    public let onCompletion: AsyncStream<Void>

    /// Initializer
    ///
    /// - Parameters:
    ///     - from: Start value
    ///     - to: End value
    ///     - transformer: Function that will compute the interpolation
    public init(from: T, to: T, transformer: @escaping TransformerFunction) {
        self.from = from
        self.to = to
        self.transformer = transformer

        let (onStartStream, onStartContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        onStart = onStartStream
        self.onStartContinuation = onStartContinuation

        let (onUpdateStream, onUpdateContinuation) = AsyncStream<T>.makeStream(bufferingPolicy: .bufferingNewest(0))
        onUpdate = onUpdateStream
        self.onUpdateContinuation = onUpdateContinuation

        let (onCompletionStream, onCompletionContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        onCompletion = onCompletionStream
        self.onCompletionContinuation = onCompletionContinuation
    }

    internal func notifyStart() {
        onStartContinuation.yield()
        onStartContinuation.finish()
    }

    internal func apply(easedValue: Float) {
        let current = transformer(from, to, easedValue)
        onUpdateContinuation.yield(current)
    }

    internal func finish(complete: Bool) {
        onCompletionContinuation.yield()

        onUpdateContinuation.finish()
        onCompletionContinuation.finish()
    }

}

extension TweenData: Tweenable { }
