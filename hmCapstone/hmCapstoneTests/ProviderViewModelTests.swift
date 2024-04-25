//
//  ProviderViewModelTests.swift
//  HmCapstoneTests
//
//  Created by Jj on 4/24/24.
//

/*
 final class ProviderViewModelTests: XCTestCase {

 override func setUpWithError() throws {
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }

 override func tearDownWithError() throws {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 }

 func testExample() throws {
 // This is an example of a functional test case.
 // Use XCTAssert and related functions to verify your tests produce the correct results.
 // Any test you write for XCTest can be annotated as throws and async.
 // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
 // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
 }

 func testPerformanceExample() throws {
 // This is an example of a performance test case.
 self.measure {
 // Put the code you want to measure the time of here.
 }
 }

 }
 */
/*
 @testable import hmCapstone

 import XCTest

 // Testing ProviderViewModel for API interactions
 @MainActor
 final class ProviderViewModelTests: XCTestCase {
 var viewModel: ProviderViewModel!

 override func setUpWithError() throws {
 super.setUpWithError()
 // Initialize the ViewModel with a mock session or dependencies
 viewModel = ProviderViewModel()
 try viewModel.setupModel()
 }

 override func tearDownWithError() throws {
 try viewModel.tearDownModel()
 viewModel = nil
 super.tearDownWithError()
 }

 // Test successful fetch of provider details
 func testFetchProviderDetailsSuccess() async throws {
 // Setup your mocking conditions here
 await viewModel.fetchProviderDetails(npi: "1234567890")
 XCTAssertEqual(viewModel.providers.count, 1, "Should have one provider on successful fetch")
 XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
 }

 // Test failure in fetching provider details
 func testFetchProviderDetailsFailure() async throws {
 // Setup conditions to simulate a network failure
 await viewModel.fetchProviderDetails(npi: "invalid")
 XCTAssertTrue(viewModel.providers.isEmpty, "Providers array should be empty after a failed fetch")
 XCTAssertNotNil(viewModel.errorMessage, "Error message should not be nil on failure")
 }

 // Test clearing error messages
 func testClearErrorMessage() throws {
 viewModel.errorMessage = "Error"
 viewModel.clearErrorMessage()
 XCTAssertNil(viewModel.errorMessage, "Error message should be cleared")
 }

 // Performance test for a specific method if needed
 func testProviderProcessingPerformance() throws {
 measure {
 // Code to measure, e.g., parsing a large JSON file
 }
 }
 }

 */

import XCTest
@testable import hmCapstone

@MainActor
final class ProviderViewModelTests: XCTestCase {
  var viewModel: ProviderViewModel!

  override func setUpWithError() throws {
    super.setUp()
    // Initialize the ViewModel
    viewModel = ProviderViewModel()
  }

  override func tearDownWithError() throws {
    viewModel = nil
    super.tearDown()
  }

  func testFetchProviderDetailsSuccess() async throws {
    // Setup to simulate fetching details successfully
    await viewModel.fetchProviderDetails(npi: "1063456713")
    XCTAssertEqual(viewModel.providers.count, 1, "Should have one provider on successful fetch")
    XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
  }

  func testFetchProviderDetailsFailure() async throws {
    // Setup to simulate a failure in fetching details
    await viewModel.fetchProviderDetails(npi: "invalid")
    XCTAssertTrue(viewModel.providers.isEmpty, "Providers array should be empty after a failed fetch")
    XCTAssertNotNil(viewModel.errorMessage, "Error message should not be nil on failure")
  }

  func testClearErrorMessage() {
    viewModel.errorMessage = "Error"
    viewModel.clearErrorMessage()
    XCTAssertNil(viewModel.errorMessage, "Error message should be cleared after calling clearErrorMessage")
  }
}

