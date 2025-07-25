import QuartzCore

@globalActor
@objc
public actor TweenManager: GlobalActor {

    public static let shared = TweenManager()

    private var runningTweens = [Tween]()
    
    private let caDisplayLink: CADisplayLink
    
    private init() {
        #if os(macOS)
        caDisplayLink = CADisplayLink()
        #else
        caDisplayLink = CADisplayLink(target: self, selector: #selector(displayLinkCallback(displaylink:)))
        #endif
        
        
    }

    func register(tween: Tween) {
        if !runningTweens.contains(where: { $0 === tween }) {
            runningTweens.append(tween)
        }
    }

    func unregister(tween: Tween) {
        runningTweens.removeAll { $0 === tween }
    }

//    @objc private func displayLinkCallback(displaylink: CADisplayLink) {
//        
//    }
}
