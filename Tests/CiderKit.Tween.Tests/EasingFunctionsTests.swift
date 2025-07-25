import Testing
@testable import CiderKit_Tween

struct EasingFunctionsTests {

    private let testData: TestData

    init() throws {
        testData = try loadEasingFunctionsTestData()
    }

    static func testableEasingCases() -> [Easing] {
        var allCases = Easing.allCases
        allCases.removeAll { $0 == .custom }
        return allCases
    }

    @Test(arguments: Self.testableEasingCases())
    func easingFunctionTest(easing: Easing) async throws {
        let key = "\(easing)"

        let testData = try #require(testData[key])
        let easingFunction = easing.easingFunction()

        for entry in testData {
            let easedValue = easingFunction(entry.timing)
            let diff = abs(easedValue - entry.expectedValue)
            #expect(diff < 0.0000015)
        }
    }

}
