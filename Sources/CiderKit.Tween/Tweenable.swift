import Combine

public protocol Tweenable: Sendable {
    
    associatedtype TweenableData: Sendable
    
    var onUpdate: AsyncStream<TweenableData> { get }
    var onCompletion: AsyncStream<Void> { get }
    
    func notifyStart() -> Void
    func apply(easedValue: Float) -> Void
    func finish(complete: Bool) -> Void
    
}
