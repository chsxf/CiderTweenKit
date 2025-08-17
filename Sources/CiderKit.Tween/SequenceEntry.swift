import Foundation

internal struct SequenceEntry {
    
    let startAt: TimeInterval
    let sequence: Sequence?
    let tweenInstance: TweenInstance?
    let duration: TimeInterval
    var elapsedTime: TimeInterval {
        get async {
            if let sequence {
                return await sequence.elapsedTime
            }
            if let tweenInstance {
                return await tweenInstance.elapsedTime
            }
            return 0
        }
    }
    
    init(startAt: TimeInterval, sequence: Sequence) async {
        self.startAt = startAt
        self.sequence = sequence
        tweenInstance = nil
        duration = await sequence.totalDuration
    }
    
    init(startAt: TimeInterval, tweenInstance: TweenInstance) async {
        self.startAt = startAt
        sequence = nil
        self.tweenInstance = tweenInstance
        duration = await tweenInstance.isLooping ? 0 : tweenInstance.duration
    }
    
    func update(additionalElapsedTime: TimeInterval) async {
        await sequence?.update(additionalElapsedTime: additionalElapsedTime)
        await tweenInstance?.update(additionalElapsedTime: additionalElapsedTime)
    }
    
    func stop() async {
        await sequence?.stop(complete: false)
        await tweenInstance?.stop(complete: false)
    }
    
}
