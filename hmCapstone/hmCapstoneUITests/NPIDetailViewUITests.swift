//
//  NPIDetailViewUITests.swift
//  hmCapstoneUITests
//
//  Created by Jj on 4/26/24.
//
/*
 import XCTest

 final class NPIDetailViewUITests: XCTestCase {

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
 import XCTest

 class NPIDetailViewUITests: XCTestCase {
 var app: XCUIApplication!

 override func setUpWithError() throws {
 continueAfterFailure = false
 app = XCUIApplication()
 app.launchArguments = ["-uitesting", "true"]
 app.launch()
 }

 func testNPIDetailViewDisplays() {
 // Assuming you navigate to the NPI detail page in the UI
 app.navigationBars.buttons["NPI Detail"].tap()

 // Check if the detail page shows the correct NPI number and provider name
 XCTAssertTrue(app.staticTexts["123456789"].exists, "NPI number should be visible on the screen.")
 XCTAssertTrue(app.staticTexts["John Doe"].exists, "Provider name should be visible on the screen.")
 }
 }
 */

// This solution below works for having the user tap on the appropriate buttons, enter an npi and click on npi details link.  Adding automated button tabs below this code to test without user interaction.
/*
 import XCTest

 class NPIDetailViewUITests: XCTestCase {
 var app: XCUIApplication?

 override func setUpWithError() throws {
 continueAfterFailure = false
 app = XCUIApplication()
 app?.launch()
 }

 override func tearDownWithError() throws {
 app = nil
 }
 func testNPIInformationDisplay() throws {
 guard let app = app else {
 XCTFail("Failed to launch the application.")
 return
 }

 let npiNumberLabel = app.staticTexts["NPI Number"]
 let providerFullNameLabel = app.staticTexts["Provider Full Name"]

 // Wait for the NPI Number label to appear with a timeout
 let exists = NSPredicate(format: "exists == true")
 expectation(for: exists, evaluatedWith: npiNumberLabel, handler: nil)
 expectation(for: exists, evaluatedWith: providerFullNameLabel, handler: nil)

 // Wait for up to 5 seconds for the expectations to be fulfilled
 waitForExpectations(timeout: 30, handler: nil)

 XCTAssertTrue(npiNumberLabel.exists, "NPI Number label should be visible")
 XCTAssertTrue(providerFullNameLabel.exists, "Provider Full Name label should be visible")
 }

 /*
  func testNPIInformationDisplay() throws {
  guard let app = app else {
  XCTFail("Failed to launch the application.")
  return
  }

  // Fetch static texts using the accessibility identifiers
  let npiNumberLabel = app.staticTexts["NPI Number"]
  let providerFullNameLabel = app.staticTexts["Provider Full Name"]

  // Assert that these elements exist and are visible
  XCTAssertTrue(npiNumberLabel.exists, "NPI Number label should be visible")
  XCTAssertTrue(providerFullNameLabel.exists, "Provider Full Name label should be visible")
  }
  */

 /*
  func testNPIInformationDisplay() throws {
  // Ensure the app is not nil
  guard let app = app else {
  XCTFail("Failed to launch the application.")
  return
  }

  // Example UI test checking if NPI Number and Provider Full Name are displayed
  XCTAssertTrue(app.staticTexts["NPI Number"].exists, "NPI Number label should be visible")
  XCTAssertTrue(app.staticTexts["Provider Full Name"].exists, "Provider Full Name label should be visible")
  }
  */
 }
 */
import XCTest
@testable import hmCapstone

class CompleteUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }

  func testCompleteFlowFromLaunchToNPIDetails() throws {
    let app = XCUIApplication()
    app.launch()

    // Optionally wait a short time to handle the Welcome screen's conditional appearance
    sleep(2)

    // Check if the Welcome screen with the "MediBlockLogoStacked" is visible
    let logoImage = app.images["MediBlockLogoStacked"]
    if logoImage.exists {
      // Proceed assuming the Welcome screen is visible
      XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen")

      // Wait for the Welcome screen to transition
      sleep(3)  // Adjust based on your app's welcome screen display time
    }

    // Ensure the 'Get Started' button can be accessed
    let getStartedButton = app.buttons["Get Started"]
    if getStartedButton.waitForExistence(timeout: 5) {
      getStartedButton.tap()
    } else {
      XCTFail("Get Started button did not appear")
    }
    /*
     // Assuming WelcomeScreen shows the logo and transitions automatically
     let logo = app.images["MediBlockLogoStacked"]
     XCTAssert(logo.waitForExistence(timeout: 3), "Logo should be visible on the welcome screen")

     // Wait for automatic transition
     sleep(3) // Adjust time based on your welcome screen's timeout

     // Tap on "Get Started" button if it's part of your onboarding
     let getStartedButton = app.buttons["Get Started"]
     if getStartedButton.waitForExistence(timeout: 5) {
     getStartedButton.tap()
     }
     */

    // Enter NPI Number
    let npiTextField = app.textFields["Enter NPI Number"]
    XCTAssert(npiTextField.waitForExistence(timeout: 5), "NPI Text field should be available after onboarding")
    npiTextField.tap()
    npiTextField.typeText("1063456713")

    // Tap on "Fetch Provider Details" button
    let fetchButton = app.buttons["Fetch Provider Details"]
    fetchButton.tap()

    // Assume there is a delay due to network request, wait for navigation to occur
    let exists = NSPredicate(format: "exists == 1")

    let publicDataTab = app.tabBars.buttons["Public Data"]
    expectation(for: exists, evaluatedWith: publicDataTab, handler: nil)
    waitForExpectations(timeout: 30, handler: nil) // Adjust timeout as necessary

    // Now navigate to NPI Details by tapping on the navigation link
    let npiDetailsButton = app.buttons["NPI Details"] // Assuming this is the identifier for the link
    if npiDetailsButton.waitForExistence(timeout: 10) {
      npiDetailsButton.tap()

      // Verify details on NPI Details screen
      let npiNumberLabel = app.staticTexts["NavigateToNPI-1063456713"]
      XCTAssertTrue(npiNumberLabel.exists, "NPI Number label should be visible on NPI Detail View")

      let providerNameLabel = app.staticTexts["Provider Full Name"]
      XCTAssertTrue(providerNameLabel.exists, "Provider Full Name label should be visible")

      let providerName = app.staticTexts["Hugh McSwain"]  // Example name to check
      XCTAssertTrue(providerName.exists, "Provider's name should be displayed on NPI Details page")


    }
  }

  override func tearDownWithError() throws {
    app = nil
  }
}
