//
//  WelcomeScreenUITests.swift

import XCTest
@testable import hmCapstone

/*
 final class WelcomeScreenUITests: XCTestCase {

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

class WelcomeScreenUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launchArguments.append("--uitesting")
    app.launch()
  }

  override func tearDownWithError() throws {
    app = nil
  }

  /*
   // Test that the welcome screen appears with all expected elements
   func testWelcomeScreenAppearance() throws {

   // Assuming "MediBlockLogoStacked" is the accessibility identifier for the image
   //   sleep(10)
   //    let logoImage = app.images["MediBlockLogoStacked"]
   //   XCTAssertTrue(logoImage.exists, "The logo image should be visible on the welcome screen.")

   let logoImage = app.images["MediBlockLogoStacked"]
   XCTAssertTrue(logoImage.waitForExistence(timeout: 10), "The logo image should be visible on the welcome screen.")

   let headlineText = app.staticTexts["Digitizing medical identity...."]
   XCTAssertTrue(headlineText.exists, "The headline text should be visible on the welcome screen.")
   }
   */

  // Test that the welcome screen transitions after the expected time
  func testWelcomeScreenTransition() throws {
    let headlineText = app.staticTexts["Digitizing medical identity...."]
    XCTAssertTrue(waitForElementToDisappear(element: headlineText, timeout: 5), "The welcome screen should disappear after 5 seconds.")

    // Check if ContentView or its identifying elements appear
    // For this, you would need to identify elements from ContentView that can be checked for existence.
    // For example:
    // let contentViewElement = app.otherElements["ContentViewIdentifier"]
    // XCTAssertTrue(contentViewElement.exists, "ContentView should be visible after the welcome screen.")
  }
  func testSpinnerVisibility() {
    let spinner = app.activityIndicators["loadingSpinner"]

    // Check that the spinner exists and is visible
//    let spinnerExists = spinner.waitForExistence(timeout: 5)
 //   XCTAssertTrue(spinnerExists, "Spinner should be visible during loading")

    // Optionally, wait for the spinner to disappear
    let spinnerDisappears = waitForElementToDisappear(element: spinner, timeout: 10)
    XCTAssertTrue(spinnerDisappears, "Spinner should disappear after loading completes")
  }

  // Helper method to wait for an element to disappear
  func waitForElementToDisappear(element: XCUIElement, timeout: TimeInterval = 10) -> Bool {
    let existsPredicate = NSPredicate(format: "exists == false")
    let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    return result == .completed
  }
}
