//  ProviderViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class ProviderViewModelTests: XCTestCase {
  var viewModel: ProviderViewModel?
  override func setUpWithError() throws {
    super.setUp()
    viewModel = ProviderViewModel()
  }
  override func tearDownWithError() throws {
    viewModel = nil
    super.tearDown()
  }
  func testFetchProviderDetailsSuccess() async throws {
    guard let viewModel = viewModel else {
      XCTFail("ProviderViewModel is not initialized")
      return
    }
    await viewModel.fetchProviderDetails(npi: "1063456713")
    XCTAssertEqual(viewModel.providers.count, 1, "Should have one provider on successful fetch")
    XCTAssertNil(viewModel.errorMessage, "Error message should be nil on success")
  }
  func testFetchProviderDetailsFailure() async throws {
    guard let viewModel = viewModel else {
      XCTFail("ProviderViewModel is not initialized")
      return
    }
    await viewModel.fetchProviderDetails(npi: "invalid")
    XCTAssertTrue(viewModel.providers.isEmpty, "Providers array should be empty after a failed fetch")
    XCTAssertNotNil(viewModel.errorMessage, "Error message should not be nil on failure")
  }
  func testClearErrorMessage() {
    guard let viewModel = viewModel else {
      XCTFail("ProviderViewModel is not initialized")
      return
    }
    viewModel.errorMessage = "Error"
    viewModel.clearErrorMessage()
    XCTAssertNil(viewModel.errorMessage, "Error message should be cleared after calling clearErrorMessage")
  }
}
