import Testing
import Foundation
@testable import CiderKit_Tween

struct CGFloatTweenTests {

    private static let from: CGFloat = 0
    private static let to: CGFloat = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("CGFloat Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGFloat.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue: CGFloat = 0
            
            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = cgfloatTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
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
