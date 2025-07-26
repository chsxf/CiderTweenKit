import Testing
import Foundation
@testable import CiderKit_Tween

struct CGRectTweenTests {

    private static let from: CGRect = CGRect(x: 0, y: 100, width: 250, height: 500)
    private static let to: CGRect = CGRect(x: 50, y: 10, width: 100, height: 400)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("CGRect Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGRect.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = CGRect()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = cgrectTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
                #expect(updatedValue == expectedValue)
                
                currentTime += Self.timeIncrement
            }
            return expectedValue
        }
        
        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }
        
        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.to)
    }

}
