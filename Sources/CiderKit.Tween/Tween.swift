import Foundation

@dynamicMemberLookup
public struct Tween<T: Sendable>: Sendable {

    internal let instance: TweenInstance
    internal let data: TweenData<T>

    public var isRunning: Bool { get async { await instance.isRunning } }
    public var isComplete: Bool { get async { await instance.isComplete } }

    internal init(_ instance: TweenInstance, _ data: TweenData<T>) {
        self.instance = instance
        self.data = data
    }

    public subscript<Result>(dynamicMember member: KeyPath<TweenData<T>, Result>) -> Result {
        data[keyPath: member]
    }

    public func update(additionalElapsedTime: TimeInterval) async {
        await instance.update(additionalElapsedTime: additionalElapsedTime)
    }

    public func stop(complete: Bool = false) async {
        await instance.stop(complete: complete)
    }

}
