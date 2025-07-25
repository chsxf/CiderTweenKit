#if os(macOS)
import AppKit
#endif

@globalActor
public actor TweenManager: GlobalActor {

    public static let shared = TweenManager()

    private var runningTweens = [Tween]()
    private var displayLinkProxy: DisplayLinkProxy? = nil
    
    #if os(macOS)
    public func startFrom(view: NSView) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }
        
        displayLinkProxy = await DisplayLinkProxy(view: view)
        start()
    }
    
    public func startFrom(window: NSWindow) async {
        guard displayLinkProxy == nil else {
            fatalError("TweenManager already initialized")
        }
        
        displayLinkProxy = await DisplayLinkProxy(window: window)
        start()
    }
    #else
    private init() async {
        displayLinkProxy = await DisplayLinkProxy()
        start()
    }
    #endif

    func register(tween: Tween) {
        if !runningTweens.contains(where: { $0 === tween }) {
            runningTweens.append(tween)
        }
    }
    
    private func start() {
        guard let displayLinkProxy else {
            fatalError("TweenManager not ready")
        }
        
        Task {
            for await timeInterval in displayLinkProxy.timeIntervals {
                for i in stride(from: runningTweens.count - 1, to: 0, by: -1) {
                    let tween = runningTweens[i]
                    if await tween.isRunning {
                        await tween.update(additionalElapsedTime: timeInterval)
                        
                        if await tween.isComplete {
                            runningTweens.remove(at: i)
                            continue
                        }
                    }
                    
                    await Task.yield()
                }
            }
        }
    }
}
