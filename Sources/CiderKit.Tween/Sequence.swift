import Foundation

public actor Sequence {
    
    internal private(set) var entries = [SequenceEntry]() {
        didSet {
            computeTotalDuration()
        }
    }
    
    internal private(set) var totalDuration: TimeInterval
    internal let manualUpdate: Bool
    
    private let onStartContinuation: AsyncStream<Void>.Continuation
    public let onStart: AsyncStream<Void>
    
    private let onCompletionContinuation: AsyncStream<Void>.Continuation
    public let onCompletion: AsyncStream<Void>
    
    internal private(set) var elapsedTime: TimeInterval = 0
    private var startHasBeenNotified: Bool = false
    private var isRunning = true
    internal private(set) var isComplete = false
    
    public init(manualUpdate: Bool = false) async {
        self.manualUpdate = manualUpdate
        totalDuration = 0
        (onStart, onStartContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        (onCompletion, onCompletionContinuation) = AsyncStream<Void>.makeStream(bufferingPolicy: .bufferingNewest(0))
        
        if !manualUpdate {
            await TweenManager.shared.register(sequence: self)
        }
    }
    
    private func computeTotalDuration() {
        totalDuration = 0
        for entry in entries {
            let entryEndTime = entry.startAt + entry.duration
            if entryEndTime > totalDuration {
                totalDuration = entryEndTime
            }
        }
    }
    
    public func insert<T: Sendable>(at: TimeInterval, tween: Tween<T>) async throws {
        guard !startHasBeenNotified else { throw SequenceError.modificationAfterStart }
        if !tween.instance.manualUpdate {
            await TweenManager.shared.unregister(tweenInstance: tween.instance)
        }
        entries.append(await SequenceEntry(startAt: at, tweenInstance: tween.instance))
    }
    
    public func insert(at: TimeInterval, sequence: Sequence) async throws {
        guard !startHasBeenNotified else { throw SequenceError.modificationAfterStart }
        if !sequence.manualUpdate {
            await TweenManager.shared.unregister(sequence: sequence)
        }
        entries.append(await SequenceEntry(startAt: at, sequence: sequence))
    }
    
    public func append<T: Sendable>(tween: Tween<T>) async throws {
        try await insert(at: totalDuration, tween: tween)
    }
    
    public func append(sequence: Sequence) async throws {
        try await insert(at: totalDuration, sequence: sequence)
    }
    
    public func update(additionalElapsedTime: TimeInterval) async {
        guard isRunning && !isComplete && additionalElapsedTime > 0 && !entries.isEmpty else {
            return
        }
        
        if !startHasBeenNotified {
            onStartContinuation.yield()
            onStartContinuation.finish()
            startHasBeenNotified = true
        }
        
        let previousElapsedTime = elapsedTime
        let applicableAdditionalElapsedTime: TimeInterval
        var shouldComplete = false
        if totalDuration > 0 {
            let remainingTime = totalDuration - elapsedTime
            if remainingTime <= additionalElapsedTime {
                applicableAdditionalElapsedTime = remainingTime
                shouldComplete = true
            }
            else {
                applicableAdditionalElapsedTime = additionalElapsedTime
            }
            elapsedTime += applicableAdditionalElapsedTime
        }
        else {
            applicableAdditionalElapsedTime = additionalElapsedTime
        }
        
        for entry in entries {
            if entry.startAt <= elapsedTime {
                let diffStart = previousElapsedTime <= entry.startAt ? entry.startAt : previousElapsedTime
                let elapsedTimeForSequence = min(applicableAdditionalElapsedTime, elapsedTime - diffStart)
                await entry.update(additionalElapsedTime: elapsedTimeForSequence)
            }
        }
        
        if shouldComplete {
            await stop(complete: true)
        }
    }
    
    public func stop(complete: Bool) async {
        if complete {
            if totalDuration > 0 {
                let remainingElapsedTime = totalDuration - elapsedTime
                await update(additionalElapsedTime: remainingElapsedTime)
            }
            isComplete = true
        }
        
        isRunning = false

        for entry in entries {
            await entry.stop()
        }
        
        if complete {
            onCompletionContinuation.yield()
        }
        onCompletionContinuation.finish()

        if !manualUpdate {
            await TweenManager.shared.unregister(sequence: self)
        }
    }
    
}
