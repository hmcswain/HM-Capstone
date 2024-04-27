//  MainTabViewUITests.swift

import XCTest
@testable import hmCapstone

class MainTabViewUITests: XCTestCase {
  var app: XCUIApplication?
  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app?.launch()
  }
  override func tearDownWithError() throws {
    app = nil
  }
  func testNavigationBetweenTabs() {
    guard let app = app else {
      XCTFail("XCUIApplication is not initialized")
      return
    }
    let publicDataTab = app.tabBars.buttons["Public Data"]
    if waitForElementToAppear(element: publicDataTab) {
      publicDataTab.tap()
      XCTAssertTrue(app.navigationBars["Public Data"].exists, "Public Data view should be visible after tap.")
    }
    let privateDataTab = app.tabBars.buttons["Private Data"]
    if waitForElementToAppear(element: privateDataTab) {
      privateDataTab.tap()
      XCTAssertTrue(app.navigationBars["Private Data"].exists, "Private Data view should be visible after tap.")
    }
  }
  func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 10) -> Bool {
    let existsPredicate = NSPredicate(format: "exists == true")
    let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    return result == .completed
  }
}
