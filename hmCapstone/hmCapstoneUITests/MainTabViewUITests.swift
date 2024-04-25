//
//  MainTabViewUITests.swift


import XCTest
@testable import hmCapstone


class MainTabViewUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }

  override func tearDownWithError() throws {
    app = nil
  }
/*
   func testTabBarItemsExistence() {
   let publicDataTab = app.tabBars.buttons["Public Data"]
   XCTAssertTrue(waitForElementToAppear(element: publicDataTab), "The Public Data tab should appear.")

   let privateDataTab = app.tabBars.buttons["Private Data"]
   XCTAssertTrue(waitForElementToAppear(element: privateDataTab), "The Private Data tab should appear.")
   }
*/

/*
   func testTabBarItemsExistence() {
   let publicDataTab = app.tabBars.buttons["Public Data"]
   waitForElementToAppear(element: publicDataTab)
   XCTAssertTrue(publicDataTab.exists, "The Public Data tab should exist.")

   let privateDataTab = app.tabBars.buttons["Private Data"]
   XCTAssertTrue(privateDataTab.exists, "The Private Data tab should exist.")
   }
*/


  func testNavigationBetweenTabs() {
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
