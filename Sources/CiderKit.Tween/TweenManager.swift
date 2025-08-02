#if os(macOS)
import AppKit
#endif

@globalActor
public actor TweenManager: GlobalActor {

    public static let shared = TweenManager()

    private var runningTweenInstances = [TweenInstance]()
    private var displayLinkProxy: DisplayLinkProxy?

    #if os(macOS)
    public func startFrom(view: NSView) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }

        displayLinkProxy = await DisplayLinkProxy(view: view)
        startPollingTimeIntervals()
    }

    public func startFrom(window: NSWindow) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }

        displayLinkProxy = await DisplayLinkProxy(window: window)
        startPollingTimeIntervals()
    }
    #else
    public func start() async {
        displayLinkProxy = await DisplayLinkProxy()
        startPollingTimeIntervals()
    }
    #endif

    func register(tweenInstance: TweenInstance) {
        if !runningTweenInstances.contains(where: { $0 === tweenInstance }) {
            runningTweenInstances.append(tweenInstance)
        }
    }

    private func startPollingTimeIntervals() {
        guard let displayLinkProxy else {
            fatalError("TweenManager not ready")
        }

        Task {
            for await timeInterval in displayLinkProxy.timeIntervals {
                for i in stride(from: runningTweenInstances.count - 1, through: 0, by: -1) {
                    let tween = runningTweenInstances[i]
                    if await tween.isRunning {
                        await tween.update(additionalElapsedTime: timeInterval)

                        if await tween.isComplete {
                            runningTweenInstances.remove(at: i)
                            continue
                        }
                    }

                    await Task.yield()
                }
            }
        }
    }
}
