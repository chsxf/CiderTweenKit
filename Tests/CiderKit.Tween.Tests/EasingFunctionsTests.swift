import Testing
@testable import CiderKit_Tween

struct EasingFunctionsTests {

    private let testData: TestData

    init() throws {
        testData = try loadEasingFunctionsTestData()
    }

    @Test(arguments: Easing.allCases)
    func easingFunctionTest(easing: Easing) async throws {
        let testData = try #require(testData[easing.description])
        let easingFunction = easing.easingFunction()

        for entry in testData {
            let easedValue = easingFunction(entry.timing)
            let diff = abs(easedValue - entry.expectedValue)
            #expect(diff < 0.0000015)
        }
    }

}
