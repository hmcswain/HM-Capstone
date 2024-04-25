//
//  MainTabViewUITests.swift
//  HmCapstoneUITests
//


/*
 import XCTest

 final class MainTabViewUITests: XCTestCase {

 override func setUpWithError() throws {
 // Put setup code here. This method is called before the invocation of each test method in the class.

 // In UI tests it is usually best to stop immediately when a failure occurs.
 continueAfterFailure = false

 // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
 }

 override func tearDownWithError() throws {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 }

 func testExample() throws {
 // UI tests must launch the application that they test.
 let app = XCUIApplication()
 app.launch()

 // Use XCTAssert and related functions to verify your tests produce the correct results.
 }

 func testLaunchPerformance() throws {
 if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
 // This measures how long it takes to launch your application.
 measure(metrics: [XCTApplicationLaunchMetric()]) {
 XCUIApplication().launch()
 }
 }
 }
 }
 */

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
