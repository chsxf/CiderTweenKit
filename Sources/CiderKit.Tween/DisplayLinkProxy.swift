import QuartzCore

#if os(macOS)
import AppKit
#endif

@MainActor
class DisplayLinkProxy: @unchecked Sendable {

    public let timeIntervals: AsyncStream<Double>
    private let timeIntervalsContinuation: AsyncStream<Double>.Continuation

    private var currentDisplayLink: CADisplayLink!

    #if os(macOS)
    init(view: NSView) {
        let (stream, continuation) = AsyncStream<Double>.makeStream(bufferingPolicy: .bufferingNewest(0))
        timeIntervals = stream
        timeIntervalsContinuation = continuation

        currentDisplayLink = view.displayLink(target: self, selector: #selector(Self.diaplayLinkCallback(displayLink:)))
        currentDisplayLink.add(to: .current, forMode: .default)
    }

    init(window: NSWindow) {
        let (stream, continuation) = AsyncStream<Double>.makeStream(bufferingPolicy: .bufferingNewest(0))
        timeIntervals = stream
        timeIntervalsContinuation = continuation

        currentDisplayLink = window.displayLink(target: self, selector: #selector(Self.diaplayLinkCallback(displayLink:)))
        currentDisplayLink.add(to: .current, forMode: .default)
    }
    #else
    init() {
        let (stream, continuation) = AsyncStream<Double>.makeStream(bufferingPolicy: .bufferingNewest(0))
        timeIntervals = stream
        timeIntervalsContinuation = continuation

        currentDisplayLink = CADisplayLink(target: self, selector: #selector(Self.diaplayLinkCallback(displayLink:)))
        currentDisplayLink.add(to: .current, forMode: .default)
    }
    #endif

    @objc
    private func diaplayLinkCallback(displayLink: CADisplayLink) {
        let timeDiff = displayLink.targetTimestamp - displayLink.timestamp
        timeIntervalsContinuation.yield(timeDiff)
    }

}
