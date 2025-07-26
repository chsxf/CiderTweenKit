import Testing
import Foundation
@testable import CiderKit_Tween

struct CGPointTweenTests {

    private static let from: CGPoint = CGPoint(x: 0, y: 100)
    private static let to: CGPoint = CGPoint(x: 50, y: 10)
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("CGPoint Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await CGPoint.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = CGPoint()
            
            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = cgpointTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
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
