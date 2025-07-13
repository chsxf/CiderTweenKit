@globalActor
public actor TweenManager: GlobalActor {

    public static let shared = TweenManager()

    private var runningTweens = [Tween]()

    func register(tween: Tween) {
        if !runningTweens.contains(where: { $0 === tween }) {
            runningTweens.append(tween)
        }
    }

    func unregister(tween: Tween) {
        runningTweens.removeAll { $0 === tween }
    }

}
