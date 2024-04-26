//
//  WelcomeScreenUITests.swift

//import XCTest
//@testable import hmCapstone

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

/*
 // old version with errors since welcome screen does not always appear if user has seen before

 //  WelcomeScreenUITests.swift

 import XCTest
 @testable import hmCapstone

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


 // Test that the welcome screen appears with all expected elements
 //  func testWelcomeScreenAppearance() throws {

 // Assuming "MediBlockLogoStacked" is the accessibility identifier for the image
 //   sleep(10)
 //    let logoImage = app.images["MediBlockLogoStacked"]
 //   XCTAssertTrue(logoImage.exists, "The logo image should be visible on the welcome screen.")
 /*
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
 */


/*
 // old attempt to correct unit testing to allow for appearance or not of the launch screen

 import XCTest
 @testable import hmCapstone

 class WelcomeScreenUITests: XCTestCase {
 var app: XCUIApplication?

 override func setUpWithError() throws {
 continueAfterFailure = false
 app = XCUIApplication()
 app?.launchArguments.append("--uitesting")
 app?.launch()
 }

 override func tearDownWithError() throws {
 app = nil
 }

 // Test that the welcome screen appears with all expected elements
 func testWelcomeScreenAppearance() throws {
 guard let app = app else {
 XCTFail("Failed to launch the application.")
 return
 }

 // Assuming "MediBlockLogoStacked" is the accessibility identifier for the image
 let logoImage = app.images["MediBlockLogoStacked"]
 XCTAssertTrue(logoImage.waitForExistence(timeout: 3.5), "The logo image should be visible on the welcome screen.")

 let headlineText = app.staticTexts["Digitizing medical identity...."]
 XCTAssertTrue(headlineText.exists, "The headline text should be visible on the welcome screen.")

 // Optionally, wait to see if the screen transitions after the headline is visible
 XCTAssertTrue(waitForElementToDisappear(element: headlineText, timeout: 3.5), "The welcome screen should disappear after 3.5 seconds.")
 }

 // Test for the presence and functionality of the 'Get Started' button if it exists
 func testGetStartedButtonFunctionality() {
 guard let app = app else {
 XCTFail("Failed to launch the application.")
 return
 }

 let getStartedButton = app.buttons["Get Started"]
 if getStartedButton.waitForExistence(timeout: 5) {
 getStartedButton.tap()
 // Further tests can be conducted post-tap if required
 } else {
 XCTFail("Get Started button did not appear")
 }
 }

 func testSpinnerVisibility() {
 guard let app = app else {
 XCTFail("Failed to launch the application.")
 return
 }

 let spinner = app.activityIndicators["loadingSpinner"]
 let spinnerExists = spinner.waitForExistence(timeout: 5)
 XCTAssertTrue(spinnerExists, "Spinner should be visible during loading")

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

 */

/*
 // new attempt to test to see if welcome screen appears or not

 import XCTest
 @testable import hmCapstone

 class WelcomeScreenUITests: XCTestCase {
 var app: XCUIApplication?

 override func setUpWithError() throws {
 continueAfterFailure = false
 app = XCUIApplication()
 app?.launchArguments.append("--uitesting")
 app?.launch()
 }

 override func tearDownWithError() throws {
 app = nil
 }

 func testAppEntryPoints() {
 guard let app = app else {
 XCTFail("Failed to launch the application.")
 return
 }

 // Check for Welcome Screen elements
 let logoImage = app.images["MediBlockLogoStacked"]
 let headlineText = app.staticTexts["Digitizing medical identity...."]
 let getStartedButton = app.buttons["Get Started"]

 // Check for Onboarding Screen elements (if distinct from Welcome Screen)
 let onboardingTitle = app.staticTexts["Onboarding Title Identifier"]

 // Wait for elements to appear with a timeout
 if logoImage.waitForExistence(timeout: 3.5) {
 XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen.")
 XCTAssertTrue(waitForElementToDisappear(element: headlineText, timeout: 3.5), "The welcome screen should disappear after 3.5 seconds.")
 // Additional actions if Welcome Screen transitions directly
 } else if onboardingTitle.waitForExistence(timeout: 5) {
 handleOnboardingScreen()
 } else if getStartedButton.waitForExistence(timeout: 5) {
 handleGetStartedFromOnboarding()
 } else {
 XCTFail("Expected entry screens did not appear.")
 }
 }

 private func handleOnboardingScreen() {
 let getStartedButton = app.buttons["Get Started"]
 XCTAssertTrue(getStartedButton.exists, "Get Started button should be available on Onboarding Screen.")
 getStartedButton.tap()
 // Verify transition to next expected screen
 }

 private func handleGetStartedFromOnboarding() {
 let npiTextField = app.textFields["Enter NPI Number"]
 XCTAssertTrue(npiTextField.waitForExistence(timeout: 5), "NPI Text field should be accessible after tapping Get Started.")
 npiTextField.tap()
 npiTextField.typeText("1063456713")

 // Continue test flow as defined in previous discussions
 }

 // Helper method to wait for an element to disappear
 func waitForElementToDisappear(element: XCUIElement, timeout: TimeInterval = 10) -> Bool {
 let existsPredicate = NSPredicate(format: "exists == false")
 let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
 let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
 return result == .completed
 }
 }

 */

//new attempt at optional unwrap as below
/*
import XCTest
@testable import hmCapstone

class WelcomeScreenUITests: XCTestCase {
  var app: XCUIApplication?

  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app?.launchArguments.append("--uitesting")
    app?.launch()
  }

  override func tearDownWithError() throws {
    app = nil
  }

  func testAppEntryPoints() {
    guard let app = app else {
      XCTFail("Failed to launch the application.")
      return
    }

    // Check for Welcome Screen elements
    let logoImage = app.images["MediBlockLogoStacked"]
    let headlineText = app.staticTexts["Digitizing medical identity...."]
    let getStartedButton = app.buttons["Get Started"]

    // Check for Onboarding Screen elements (if distinct from Welcome Screen)
    let onboardingTitle = app.staticTexts["Onboarding Title Identifier"]

    // Wait for elements to appear with a timeout
    if logoImage.waitForExistence(timeout: 3.5) {
      XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen.")
      XCTAssertTrue(waitForElementToDisappear(element: headlineText, timeout: 3.5), "The welcome screen should disappear after 3.5 seconds.")
    } else if onboardingTitle.waitForExistence(timeout: 5) {
      handleOnboardingScreen(app: app)
    } else if getStartedButton.waitForExistence(timeout: 5) {
      handleGetStartedFromOnboarding(app: app)
    } else {
      XCTFail("Expected entry screens did not appear.")
    }
  }
  private func handleOnboardingScreen(app: XCUIApplication) {
    let getStartedButton = app.buttons["Get Started"].firstMatch
    if getStartedButton.waitForExistence(timeout: 5) {
      getStartedButton.tap()
    } else {
      XCTFail("Get Started button should be available on Onboarding Screen.")
    }
  }

  private func handleGetStartedFromOnboarding(app: XCUIApplication) {
    let npiTextField = app.textFields["Enter NPI Number"].firstMatch
    if npiTextField.waitForExistence(timeout: 5) {
      npiTextField.tap()
      npiTextField.typeText("1063456713")
      // Tap on "Fetch Provider Details" button
      let fetchButton = app.buttons["Fetch Provider Details"]
      fetchButton.tap()
    } else {
      XCTFail("NPI Text field should be accessible after tapping Get Started.")
    }
  }

  /*
   private func handleOnboardingScreen(app: XCUIApplication) {
   guard let getStartedButton = app.buttons["Get Started"].firstMatch, getStartedButton.exists else {
   XCTFail("Get Started button should be available on Onboarding Screen.")
   return
   }
   getStartedButton.tap()
   // Verify transition to next expected screen
   }

   private func handleGetStartedFromOnboarding(app: XCUIApplication) {
   guard let npiTextField = app.textFields["Enter NPI Number"].firstMatch, npiTextField.exists else {
   XCTFail("NPI Text field should be accessible after tapping Get Started.")
   return
   }
   npiTextField.tap()
   npiTextField.typeText("1063456713")
   }
   */

  // Helper method to wait for an element to disappear
  func waitForElementToDisappear(element: XCUIElement, timeout: TimeInterval = 10) -> Bool {
    let existsPredicate = NSPredicate(format: "exists == false")
    let expectation = XCTNSPredicateExpectation(predicate: existsPredicate, object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    return result == .completed
  }
}
*/
