//  NPPESAPIModelTests.swift

import XCTest
@testable import hmCapstone

final class NPPESAPIModelTests: XCTestCase {
  func testApiResponseDecoding() throws {
    let json = """
        {
          "result_count": 1,
          "results": [
            {
              "enumeration_type": "NPI-1",
              "number": "123456789",
              "basic": {
                "first_name": "John",
                "last_name": "Doe",
                "credential": "MD",
                "sole_proprietor": "No",
                "gender": "Male",
                "enumeration_date": "2006-06-15",
                "last_updated": "2023-03-07",
                "status": "Active"
              },
              "addresses": [
                {
                  "country_name": "USA",
                  "city": "New York",
                  "state": "NY",
                  "postal_code": "10001"
                }
              ],
              "taxonomies": [
                {
                  "desc": "General Medicine",
                  "state": "NY",
                  "primary": true
                }
              ]
            }
          ]
        }
        """
    if let data = json.data(using: .utf8) {
      let decoder = JSONDecoder()
      let apiResponse = try decoder.decode(ApiResponse.self, from: data)
      XCTAssertEqual(apiResponse.resultCount, 1)
      XCTAssertEqual(apiResponse.results.first?.number, "123456789")
    } else {
      XCTFail("Failed to convert JSON string to Data")
    }
  }
  func testProviderDecoding() throws {
    let json = """
        {
          "enumeration_type": "NPI-1",
          "number": "123456789",
          "basic": {
            "first_name": "John",
            "last_name": "Doe",
            "credential": "MD",
            "sole_proprietor": "No",
            "gender": "Male",
            "enumeration_date": "2006-06-15",
            "last_updated": "2023-03-07",
            "status": "Active"
          },
          "addresses": [
            {
              "country_name": "USA",
              "city": "New York",
              "state": "NY",
              "postal_code": "10001"
            }
          ],
          "taxonomies": [
            {
              "desc": "General Medicine",
              "state": "NY",
              "primary": true
            }
          ]
        }
        """
    if let data = json.data(using: .utf8) {
      let decoder = JSONDecoder()
      let provider = try decoder.decode(Provider.self, from: data)
      XCTAssertEqual(provider.number, "123456789")
    } else {
      XCTFail("Failed to convert JSON string to Data")
    }
  }
  func testProviderDecodingWithIncompleteData() throws {
    let json = """
        {
          "enumeration_type": "NPI-1",
          "number": "123456789",
          "basic": {
            "first_name": "John"
          }
        }
        """
    if let data = json.data(using: .utf8) {
      let decoder = JSONDecoder()
      XCTAssertThrowsError(try decoder.decode(Provider.self, from: data))
    } else {
      XCTFail("Failed to convert JSON string to Data")
    }
  }
  func testProviderDecodingPerformance() {
    let json = """
        {
          "enumeration_type": "NPI-1",
          "number": "123456789",
          "basic": {
            "first_name": "John",
            "last_name": "Doe",
            "credential": "MD",
            "sole_proprietor": "No",
            "gender": "Male",
            "enumeration_date": "2006-06-15",
            "last_updated": "2023-03-07",
            "status": "Active"
          },
          "addresses": [
            {
              "country_name": "USA",
              "city": "New York",
              "state": "NY",
              "postal_code": "10001"
            }
          ],
          "taxonomies": [
            {
              "desc": "General Medicine",
              "state": "NY",
              "primary": true
            }
          ]
        }
        """
    if let data = json.data(using: .utf8) {
      measure {
        let decoder = JSONDecoder()
        _ = try? decoder.decode(Provider.self, from: data)
      }
    }
  }
}
