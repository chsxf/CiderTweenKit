import Foundation

public actor TweenInstance {

    private let tweenData: any Tweenable

    internal let duration: TimeInterval
    public private(set) var elapsedTime: TimeInterval = 0

    internal let easing: Easing

    public private(set) var isRunning: Bool = true
    public private(set) var isComplete: Bool = false

    public init(tweenData: any Tweenable, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async {
        self.tweenData = tweenData

        self.duration = duration
        self.easing = easing

        if !manualUpdate {
            await TweenManager.shared.register(tweenInstance: self)
        }
    }

    func update(additionalElapsedTime: TimeInterval) {
        guard !isComplete && additionalElapsedTime > 0 else {
            return
        }

        if elapsedTime == 0 {
            tweenData.notifyStart()
        }

        elapsedTime += additionalElapsedTime
        if elapsedTime >= duration {
            elapsedTime = duration
            isComplete = true
        }

        let elapsedTimeRatio = Float(elapsedTime / duration)
        let easedValue = easing.easingFunction()(elapsedTimeRatio)

        if isComplete {
            stop(complete: isComplete)
        }
        else {
            tweenData.apply(easedValue: easedValue)
        }
    }

    public func stop(complete: Bool = false) {
        isRunning = false

        if complete {
            let easedValue = easing.easingFunction()(1)
            tweenData.apply(easedValue: easedValue)
        }
        tweenData.finish(complete: complete)
    }

}
