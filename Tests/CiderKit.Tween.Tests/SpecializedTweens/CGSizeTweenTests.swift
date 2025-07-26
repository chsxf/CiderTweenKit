import Testing
import Foundation
@testable import CiderKit_Tween

struct CGSizeTweenTests {

    private static let from: CGSize = CGSize(width: 250, height: 500)
    private static let to: CGSize = CGSize(width: 100, height: 400)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("CGSize Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGSize.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = CGSize()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = cgsizeTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
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
