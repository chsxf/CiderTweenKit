protocol Tweenable: Sendable {

    associatedtype TweenableData: Sendable

    var onUpdate: AsyncStream<TweenableData> { get }
    var onCompletion: AsyncStream<Void> { get }

    func notifyStart()
    func apply(easedValue: Float)
    func finish(complete: Bool)

}
