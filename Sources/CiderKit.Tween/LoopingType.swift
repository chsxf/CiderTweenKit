public enum LoopingType: Sendable {

    case none
    case normal(loopCount: UInt)
    case pingPong(loopCount: UInt)

}
