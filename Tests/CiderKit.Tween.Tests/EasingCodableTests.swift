import Testing
import Foundation
@testable import CiderKit_Tween

struct CodableContainer: Codable {

    public let easing: Easing

    static func computeEncodedString(easing: Easing) -> String {
        "{\"easing\":\"\(easing.description)\"}"
    }

}

struct EasingCodableTests {

    @Test func customEncodingTest() async throws {
        let customEasing = Easing.custom(EasingFunctions.linear(_:))
        let encode = JSONEncoder()
        #expect(throws: EasingError.self) {
            try encode.encode(customEasing)
        }
    }

    @Test(arguments: Easing.allCases)
    func encodingTest(easing: Easing) async throws {
        let encoder = JSONEncoder()
        let container = CodableContainer(easing: easing)
        let encodedJSON = try encoder.encode(container)
        let encodedJSONString = String(data: encodedJSON, encoding: .utf8)
        let expectedString = CodableContainer.computeEncodedString(easing: easing)
        #expect(encodedJSONString == expectedString)
    }

    @Test(arguments: Easing.allCases)
    func decodingTest(easing: Easing) async throws {
        let encodedString = CodableContainer.computeEncodedString(easing: easing)
        let encodedData = Data(encodedString.utf8)
        let decoder = JSONDecoder()
        let decodedContainer = try decoder.decode(CodableContainer.self, from: encodedData)
        #expect(decodedContainer.easing.description == easing.description)
    }

}
