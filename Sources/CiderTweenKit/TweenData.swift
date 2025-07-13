import Foundation
@preconcurrency import Combine

public struct TweenData<T: Sendable>: Tweenable {
    
    public typealias TransformerFunction = @Sendable (T, T, Float) -> T
    
    public let from: T
    public let to: T
    internal let transformer: TransformerFunction
    
    private let onStartContinuation: AsyncStream<Void>.Continuation
    public let onStart: AsyncStream<Void>
    
    private let onUpdateContinuation: AsyncStream<T>.Continuation
    public let onUpdate: AsyncStream<T>
    
    private let onCompletionContinuation: AsyncStream<Void>.Continuation
    public let onCompletion: AsyncStream<Void>
    
    init(from: T, to: T, transformer: @escaping TransformerFunction) {
        self.from = from
        self.to = to
        self.transformer = transformer
        
        let (onStartStream, onStartContinuation) = AsyncStream<Void>.makeStream()
        onStart = onStartStream
        self.onStartContinuation = onStartContinuation
        
        let (onUpdateStream, onUpdateContinuation) = AsyncStream<T>.makeStream()
        onUpdate = onUpdateStream
        self.onUpdateContinuation = onUpdateContinuation
        
        let (onCompletionStream, onCompletionContinuation) = AsyncStream<Void>.makeStream()
        onCompletion = onCompletionStream
        self.onCompletionContinuation = onCompletionContinuation
    }
    
    public func notifyStart() {
        onStartContinuation.yield()
        onStartContinuation.finish()
    }
    
    public func apply(easedValue: Float) {
        let current = transformer(from, to, easedValue)
        onUpdateContinuation.yield(current)
    }
    
    public func finish(complete: Bool) {
        onCompletionContinuation.yield()
        
        onUpdateContinuation.finish()
        onCompletionContinuation.finish()
    }
    
}
