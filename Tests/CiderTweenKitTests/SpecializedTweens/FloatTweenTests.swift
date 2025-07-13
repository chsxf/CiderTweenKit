import Testing
import Foundation
@testable import CiderTweenKit

struct Test {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test func basicTest() async throws {
        let (tween, tweenData) = await Float.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let startTask = Task {
            var startRegistered = false
            for await _ in tweenData.onStart {
                startRegistered = true
            }
            return startRegistered
        }
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue: Float = 0
            
            for await updatedFloat in tweenData.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = Self.from + (Self.to - Self.from) * easedValue
                #expect(updatedFloat == expectedValue)
                
                currentTime += Self.timeIncrement
            }
            return expectedValue
        }
        
        let completionTask = Task {
            var completionRegistered = false
            for await _ in tweenData.onCompletion {
                completionRegistered = true
            }
            return completionRegistered
        }
        
        for _ in 1...5 {
            await tween.update(additionalElapsedTime: Self.timeIncrement)
        }
        
        let startFinalValue = await startTask.value
        #expect(startFinalValue)
        
        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == 100.0)
        
        let completionValue = await completionTask.value
        #expect(completionValue)
    }

}
