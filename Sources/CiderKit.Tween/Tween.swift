@dynamicMemberLookup
public struct Tween<T: Sendable>: Sendable {

    internal let instance: TweenInstance
    internal let data: TweenData<T>

    internal init(_ instance: TweenInstance, _ data: TweenData<T>) {
        self.instance = instance
        self.data = data
    }

    subscript<Result>(dynamicMember member: KeyPath<TweenData<T>, Result>) -> Result {
        data[keyPath: member]
    }

}
