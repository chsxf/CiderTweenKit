import Testing
import Foundation
@testable import CiderKit_Tween

struct FloatTweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test func tweenTest() async throws {
        let tween = await Float.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue: Float = 0
            
            for await updatedFloat in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = Self.from + (Self.to - Self.from) * easedValue
                #expect(updatedFloat == expectedValue)
                
                currentTime += Self.timeIncrement
            }
            return expectedValue
        }
        
        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }
        
        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == 100.0)
    }

}
