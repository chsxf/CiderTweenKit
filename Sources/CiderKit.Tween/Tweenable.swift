protocol Tweenable: Sendable {

    associatedtype TweenableData: Sendable

    var onUpdate: AsyncStream<TweenableData> { get }
    var onCompletion: AsyncStream<Void> { get }

    func notifyStart()
    func apply(easedValue: Float)
    func notifyLoopCompletion(loopNumber: UInt)
    func finish(complete: Bool)

}
