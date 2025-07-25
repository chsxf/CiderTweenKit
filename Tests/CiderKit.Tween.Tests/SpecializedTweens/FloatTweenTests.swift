import Testing
import Foundation
@testable import CiderKit_Tween

struct FloatTweenTests {

    private static let from: Float = 0
    private static let to: Float = 100
    private static let duration: TimeInterval = 5
    private static let timeIncrement: TimeInterval = 1
    
    @Test("Float Tween Test", .tags(.specializedTweenTest))
    func tweenTest() async throws {
        let tween = await Float.tween(from: Self.from, to: Self.to, duration: Self.duration, manualUpdate: true)
        
        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue: Float = 0
            
            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = floatTweenTransformer(from: Self.from, to: Self.to, easedValue: easedValue)
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

    private static let simd2From = SIMD2<Float>()
    private static let simd2To = SIMD2<Float>(100, 100)

    @Test("SIMD2<Float> Tween Test", .tags(.specializedTweenTest))
    func simd2tweenTest() async throws {
        let tween = await SIMD2<Float>.tween(from: Self.simd2From, to: Self.simd2To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD2<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd2floatTweenTransformer(from: Self.simd2From, to: Self.simd2To, easedValue: easedValue)
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

    private static let simd3From = SIMD3<Float>()
    private static let simd3To = SIMD3<Float>(100, 100, 100)

    @Test("SIMD3<Float> Tween Test", .tags(.specializedTweenTest))
    func simd3tweenTest() async throws {
        let tween = await SIMD3<Float>.tween(from: Self.simd3From, to: Self.simd3To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD3<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd3floatTweenTransformer(from: Self.simd3From, to: Self.simd3To, easedValue: easedValue)
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

    private static let simd4From = SIMD4<Float>()
    private static let simd4To = SIMD4<Float>(lowHalf: simd2To, highHalf: simd2To)

    @Test("SIMD4<Float> Tween Test", .tags(.specializedTweenTest))
    func simd4tweenTest() async throws {
        let tween = await SIMD4<Float>.tween(from: Self.simd4From, to: Self.simd4To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD4<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd4floatTweenTransformer(from: Self.simd4From, to: Self.simd4To, easedValue: easedValue)
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

    private static let simd8From = SIMD8<Float>()
    private static let simd8To = SIMD8<Float>(lowHalf: simd4To, highHalf: simd4To)

    @Test("SIMD8<Float> Tween Test", .tags(.specializedTweenTest))
    func simd8tweenTest() async throws {
        let tween = await SIMD8<Float>.tween(from: Self.simd8From, to: Self.simd8To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD8<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd8floatTweenTransformer(from: Self.simd8From, to: Self.simd8To, easedValue: easedValue)
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

    private static let simd16From = SIMD16<Float>()
    private static let simd16To = SIMD16<Float>(lowHalf: simd8To, highHalf: simd8To)

    @Test("SIMD16<Float> Tween Test", .tags(.specializedTweenTest))
    func simd16tweenTest() async throws {
        let tween = await SIMD16<Float>.tween(from: Self.simd16From, to: Self.simd16To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD16<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd16floatTweenTransformer(from: Self.simd16From, to: Self.simd16To, easedValue: easedValue)
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

    private static let simd32From = SIMD32<Float>()
    private static let simd32To = SIMD32<Float>(lowHalf: simd16To, highHalf: simd16To)

    @Test("SIMD32<Float> Tween Test", .tags(.specializedTweenTest))
    func simd32tweenTest() async throws {
        let tween = await SIMD32<Float>.tween(from: Self.simd32From, to: Self.simd32To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD32<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd32floatTweenTransformer(from: Self.simd32From, to: Self.simd32To, easedValue: easedValue)
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

    private static let simd64From = SIMD64<Float>()
    private static let simd64To = SIMD64<Float>(lowHalf: simd32To, highHalf: simd32To)

    @Test("SIMD64<Float> Tween Test", .tags(.specializedTweenTest))
    func simd64tweenTest() async throws {
        let tween = await SIMD64<Float>.tween(from: Self.simd64From, to: Self.simd64To, duration: Self.duration, manualUpdate: true)

        let updateTask = Task {
            var currentTime: TimeInterval = Self.timeIncrement
            var expectedValue = SIMD64<Float>()

            for await updatedValue in tween.onUpdate {
                let timeRatio = Float(currentTime / Self.duration)
                let easedValue = EasingFunctions.linear(timeRatio)
                expectedValue = simd64floatTweenTransformer(from: Self.simd64From, to: Self.simd64To, easedValue: easedValue)
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
