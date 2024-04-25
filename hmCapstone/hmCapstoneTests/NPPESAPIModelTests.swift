//
//  NPPESAPIModelTests.swift
//  HmCapstoneTests
//


import XCTest
@testable import hmCapstone

final class NPPESAPIModelTests: XCTestCase {
  // Test successful decoding of the ApiResponse
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
        """.data(using: .utf8)!
    let decoder = JSONDecoder()
    let apiResponse = try decoder.decode(ApiResponse.self, from: json)
    XCTAssertEqual(apiResponse.resultCount, 1)
    XCTAssertEqual(apiResponse.results.first?.number, "123456789")
    // Additional checks for nested structures
  }
  // Test decoding of Provider struct
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
        """.data(using: .utf8)!

    let decoder = JSONDecoder()
    let provider = try decoder.decode(Provider.self, from: json)
    XCTAssertEqual(provider.number, "123456789")
    XCTAssertEqual(provider.basic.firstName, "John")
    // Additional checks
  }

  // Test for incomplete data handling
  func testProviderDecodingWithIncompleteData() throws {
    let json = """
        {
          "enumeration_type": "NPI-1",
          "number": "123456789",
          "basic": {
            "first_name": "John"
          }
        }
        """.data(using: .utf8)!

    let decoder = JSONDecoder()
    XCTAssertThrowsError(try decoder.decode(Provider.self, from: json))
  }

  // Performance test for decoding
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
        """.data(using: .utf8)!
    measure {
      let decoder = JSONDecoder()
      _ = try? decoder.decode(Provider.self, from: json)
    }
  }
}
