import Testing
import Foundation
@testable import CiderKit_Tween

struct TweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test func eventTest() async throws {
        let tween = await Float.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let startTask = Task {
            var startRegistered = false
            for await _ in tween.onStart {
                startRegistered = true
            }
            return startRegistered
        }
        
        var updateCount: Int = 0
        let updateTask = Task {
            var expectedValue: Float = 0
            for await updatedFloat in tween.onUpdate {
                updateCount += 1
                expectedValue = updatedFloat
            }
            return expectedValue
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in tween.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }
        
        // Additional call to update that should do nothing
        await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        
        let startFinalValue = await startTask.value
        #expect(startFinalValue)
        
        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.to)
        #expect(updateCount == 5)
        
        let completionValue = await completionTask.value
        #expect(completionValue)
    }

}
