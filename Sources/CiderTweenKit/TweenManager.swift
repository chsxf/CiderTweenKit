@globalActor
actor TweenManager: GlobalActor {

    static let shared = TweenManager()

    private var runningTweenables = [any Tweenable]()

    func register(tweenable: any Tweenable) {
        if !runningTweenables.contains(where: { $0 === tweenable }) {
            runningTweenables.append(tweenable)
        }
    }

    func unregister(tweenable: any Tweenable) {
        runningTweenables.removeAll { $0 === tweenable }
    }

}
