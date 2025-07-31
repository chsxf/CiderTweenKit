import Testing
import Foundation
@testable import CiderKit_Tween

struct TweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    private static let updateLoops: Int = 5
    
    @Test func eventTest() async throws {
        let tween = await Float.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let startTask = Task {
            var startRegistered = false
            for await _ in tween.onStart {
                startRegistered = true
            }
            return startRegistered
        }
        
        let updateTask = Task {
            var updateCount = 0
            for await _ in tween.onUpdate {
                updateCount += 1
            }
            return updateCount
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        let tweenTask = Task {
            for _ in 1...Self.updateLoops {
                try await Task.sleep(nanoseconds: tweenTaskDelay)
                await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
            }
            
            // Additional call to update that should do nothing
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }
        
        let (startFinalValue, updateFinalValue, completionValue, _) = try await (startTask.value, updateTask.value, completionTask.value, tweenTask.value)
        #expect(startFinalValue)
        #expect(updateFinalValue == Self.updateLoops)
        #expect(completionValue)
    }

}
