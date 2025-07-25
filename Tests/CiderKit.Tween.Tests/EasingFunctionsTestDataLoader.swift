import Foundation

typealias TestData = [String: [TestDataEntry]]

enum DataLoaderError: Error {
    case unableToParseFloat(source: Substring)
}

struct TestDataEntry {
    var timing: Float
    var expectedValue: Float
}

func loadEasingFunctionsTestData() throws -> TestData {
    let dataURL = Bundle.module.url(forResource: "EasingFunctionsTestData", withExtension: "txt")

    let fileContents = try! String(contentsOf: dataURL!)
    let lines = fileContents.split(separator: "\n", omittingEmptySubsequences: true)

    var result = TestData()

    var currentSectionName = ""
    var currentDataSet = [TestDataEntry]()

    let dataRegex = /^(.+) => (.+)$/
    for line in lines {
        if line == "====" {
            if !currentDataSet.isEmpty {
                result[currentSectionName] = currentDataSet
                currentSectionName = ""
                currentDataSet = [TestDataEntry]()
            }
            continue
        }

        if let match = try dataRegex.firstMatch(in: line) {
            guard let timing = Float(match.1) else {
                throw DataLoaderError.unableToParseFloat(source: match.1)
            }

            guard let expectedValue = Float(match.2) else {
                throw DataLoaderError.unableToParseFloat(source: match.2)
            }

            currentDataSet.append(TestDataEntry(timing: timing, expectedValue: expectedValue))
        }
        else {
            currentSectionName = String(line)
        }
    }

    if !currentDataSet.isEmpty {
        result[currentSectionName] = currentDataSet
    }

    return result
}
