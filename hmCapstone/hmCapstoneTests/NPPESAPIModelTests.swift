//  NPPESAPIModelTests.swift

import XCTest
@testable import hmCapstone

final class NPPESAPIModelTests: XCTestCase {
  func loadTestData(from fileName: String) throws -> Data {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
      XCTFail("Missing file: \(fileName).json")
      throw NSError(domain: "Test", code: 1, userInfo: nil)
    }
    return try Data(contentsOf: url)
  }
  func testApiResponseDecoding() throws {
    let data = try loadTestData(from: "MockApiResponse")
    let decoder = JSONDecoder()
    let apiResponse = try decoder.decode(ApiResponse.self, from: data)
    XCTAssertEqual(apiResponse.resultCount, 1)
    XCTAssertEqual(apiResponse.results.first?.number, "123456789")
  }
  func testProviderDecoding() throws {
    let data = try loadTestData(from: "MockProvider")
    let decoder = JSONDecoder()
    let provider = try decoder.decode(Provider.self, from: data)
    XCTAssertEqual(provider.number, "123456789")
  }
  func testProviderDecodingWithIncompleteData() throws {
    let data = try loadTestData(from: "MockIncompleteProvider")
    let decoder = JSONDecoder()
    XCTAssertThrowsError(try decoder.decode(Provider.self, from: data))
  }
  func testProviderDecodingPerformance() {
    measure {
      if let data = try? loadTestData(from: "MockProvider") {
        let decoder = JSONDecoder()
        _ = try? decoder.decode(Provider.self, from: data)
      }
    }
  }
}
