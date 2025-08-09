import Foundation

/// Represents a tween and is the main point of interaction with it
///
/// > Note: This type has dynamic member lookup for ```TweenData```
@dynamicMemberLookup
public struct Tween<T: Sendable>: Sendable {

    internal let instance: TweenInstance
    internal let data: TweenData<T>

    /// Indicates if the tween is running or not. The ```isComplete``` is `true`, this is always `false`
    public var isRunning: Bool { get async { await instance.isRunning } }
    /// Indicates if the tween has completed or not
    public var isComplete: Bool { get async { await instance.isComplete } }

    /// Initializer
    ///
    /// - Parameters:
    ///     - data: Data for the tween (start and end values, and interpolation function)
    ///     - duration: Duration in seconds of the tween
    ///     - easing: Easing type (defaults to ```Easing/linear```
    ///     - manualUpdate: If set, the tween won't be animated automatically and you will be resposible for calling ```update(additionalElapsedTime:)```
    public init(data: TweenData<T>, duration: TimeInterval, easing: Easing = .linear, manualUpdate: Bool = false) async {
        self.data = data
        instance = await TweenInstance(tweenData: data, duration: duration, easing: easing, manualUpdate: manualUpdate)
    }
    
    /// Dymamic accessor for members of ```TweenData```.
    public subscript<Result>(dynamicMember member: KeyPath<TweenData<T>, Result>) -> Result {
        data[keyPath: member]
    }

    /// Progress the tween by a certain amount of time in seconds
    ///
    /// > Note: You should only call this function if the tween is updated automatically by the ```TweenManager```
    ///
    /// - Parameter additionalElapsedTime: Amount of time in seconds of tween progress
    public func update(additionalElapsedTime: TimeInterval) async {
        await instance.update(additionalElapsedTime: additionalElapsedTime)
    }

    /// Stops the tween
    ///
    /// - Parameter complete: if set, the tween will reach its end value before stopping
    public func stop(complete: Bool = false) async {
        await instance.stop(complete: complete)
    }

}
