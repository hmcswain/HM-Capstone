//  NPIDetailViewTests.swift

import XCTest
@testable import hmCapstone

class NPIDetailViewTests: XCTestCase {
  var viewModel: ProviderViewModel?
  @MainActor
  override func setUp() {
    super.setUp()
    viewModel = ProviderViewModel.mock()  // Use optional here
    viewModel?.providers = [Provider.mock()]
  }
  @MainActor
  func testProviderDataDisplayed() throws {
    let testViewModel = try XCTUnwrap(viewModel, "ViewModel should not be nil")
    guard let provider = testViewModel.providers.first else {
      XCTFail("Provider list should contain at least one element")
      return
    }
    XCTAssertEqual(provider.number, "123456789", "The NPI number should match the mock provider data.")
  }
}
