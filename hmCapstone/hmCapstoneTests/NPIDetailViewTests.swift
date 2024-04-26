//
//  NPIDetailViewTests.swift
//  hmCapstoneTests
//
//  Created by Jj on 4/25/24.
//
/*
 import XCTest

 final class NPIDetailViewTests: XCTestCase {

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
// compiles code but has optionals
/*
 import XCTest
 @testable import hmCapstone

 class NPIDetailViewTests: XCTestCase {
 var viewModel: ProviderViewModel!
 var mockProvider: Provider!

 @MainActor override func setUp() {
 super.setUp()
 viewModel = ProviderViewModel.mock()  // Using the mock instance
 mockProvider = Provider.mock()  // Assuming Provider.mock() is defined to return a specific test provider
 viewModel.providers = [mockProvider]
 }

 @MainActor func testProviderDataDisplayed() {
 // Assuming you have a way to access the display fields, possibly through a simulated binding
 let displayedNPI = viewModel.providers.first(where: { $0.number == mockProvider.number })?.number
 XCTAssertEqual(displayedNPI, "123456789", "The NPI number should match the mock provider data.")
 }
 }
*/

import XCTest
@testable import hmCapstone

class NPIDetailViewTests: XCTestCase {
    var viewModel: ProviderViewModel?

  @MainActor override func setUp() {
        super.setUp()
        viewModel = ProviderViewModel.mock()  // Use optional here
        viewModel?.providers = [Provider.mock()]
    }

  @MainActor func testProviderDataDisplayed() throws {
        // Use XCTUnwrap to ensure viewModel is not nil and to handle the case safely
        let testViewModel = try XCTUnwrap(viewModel, "ViewModel should not be nil")

        // Ensure that we can access the first provider, handling the potential nil safely
        guard let provider = testViewModel.providers.first else {
            XCTFail("Provider list should contain at least one element")
            return
        }

        XCTAssertEqual(provider.number, "123456789", "The NPI number should match the mock provider data.")
    }
}
