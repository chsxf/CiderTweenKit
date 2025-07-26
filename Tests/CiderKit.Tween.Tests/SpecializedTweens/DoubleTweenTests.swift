import Testing
import Foundation
@testable import CiderKit_Tween

struct DoubleTweenTests {

    private static let from: Double = 0
    private static let to: Double = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("Double Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await Double.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue: Double = 0
            
            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = doubleTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
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

    private static let simd2From = SIMD2<Double>()
    private static let simd2To = SIMD2<Double>(100, 100)

    @Test("SIMD2<Double> Tween Test", .tags(.specializedTweenTest))
    func simd2tweenTest() async throws {
        let tween = await SIMD2<Double>.tween(from: Self.simd2From, to: Self.simd2To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD2<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd2doubleTweenTransformer(from: Self.simd2From, to: Self.simd2To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd2To)
    }

    private static let simd3From = SIMD3<Double>()
    private static let simd3To = SIMD3<Double>(100, 100, 100)

    @Test("SIMD3<Double> Tween Test", .tags(.specializedTweenTest))
    func simd3tweenTest() async throws {
        let tween = await SIMD3<Double>.tween(from: Self.simd3From, to: Self.simd3To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD3<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd3doubleTweenTransformer(from: Self.simd3From, to: Self.simd3To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd3To)
    }

    private static let simd4From = SIMD4<Double>()
    private static let simd4To = SIMD4<Double>(lowHalf: simd2To, highHalf: simd2To)

    @Test("SIMD4<Double> Tween Test", .tags(.specializedTweenTest))
    func simd4tweenTest() async throws {
        let tween = await SIMD4<Double>.tween(from: Self.simd4From, to: Self.simd4To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD4<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd4doubleTweenTransformer(from: Self.simd4From, to: Self.simd4To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd4To)
    }

    private static let simd8From = SIMD8<Double>()
    private static let simd8To = SIMD8<Double>(lowHalf: simd4To, highHalf: simd4To)

    @Test("SIMD8<Double> Tween Test", .tags(.specializedTweenTest))
    func simd8tweenTest() async throws {
        let tween = await SIMD8<Double>.tween(from: Self.simd8From, to: Self.simd8To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD8<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd8doubleTweenTransformer(from: Self.simd8From, to: Self.simd8To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd8To)
    }

    private static let simd16From = SIMD16<Double>()
    private static let simd16To = SIMD16<Double>(lowHalf: simd8To, highHalf: simd8To)

    @Test("SIMD16<Double> Tween Test", .tags(.specializedTweenTest))
    func simd16tweenTest() async throws {
        let tween = await SIMD16<Double>.tween(from: Self.simd16From, to: Self.simd16To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD16<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd16doubleTweenTransformer(from: Self.simd16From, to: Self.simd16To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd16To)
    }

    private static let simd32From = SIMD32<Double>()
    private static let simd32To = SIMD32<Double>(lowHalf: simd16To, highHalf: simd16To)

    @Test("SIMD32<Double> Tween Test", .tags(.specializedTweenTest))
    func simd32tweenTest() async throws {
        let tween = await SIMD32<Double>.tween(from: Self.simd32From, to: Self.simd32To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD32<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd32doubleTweenTransformer(from: Self.simd32From, to: Self.simd32To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd32To)
    }

    private static let simd64From = SIMD64<Double>()
    private static let simd64To = SIMD64<Double>(lowHalf: simd32To, highHalf: simd32To)

    @Test("SIMD64<Double> Tween Test", .tags(.specializedTweenTest))
    func simd64tweenTest() async throws {
        let tween = await SIMD64<Double>.tween(from: Self.simd64From, to: Self.simd64To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD64<Double>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd64doubleTweenTransformer(from: Self.simd64From, to: Self.simd64To, easedValue: easedValue)
                #expect(updatedValue == expectedValue)

                currentTime += Self.timeIncrement
            }
            return expectedValue
        }

        for _ in 1...5 {
            await tween.instance.update(additionalElapsedTime: Self.timeIncrement)
        }

        let updateFinalValue = await updateTask.value
        #expect(updateFinalValue == Self.simd64To)
    }

}
