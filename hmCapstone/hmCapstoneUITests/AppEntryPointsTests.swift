//
//  AppEntryPointsTests.swift
//  hmCapstoneUITests
//
//  Created by Jj on 4/26/24.
//
/*
 import XCTest

 final class AppEntryPointsTests: XCTestCase {

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
 //old method using forced unwrapping

 import XCTest

 class AppEntryPointsTests: XCTestCase {
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

 func testAppEntryPoints() {
 // Wait a bit to determine the current view
 sleep(3)

 if app.staticTexts["Digitizing medical identity...."].exists {
 handleWelcomeScreen()
 } else if app.buttons["Get Started"].exists {
 handleOnboardingScreen()
 } else if app.textFields["Enter NPI Number"].exists {
 handleHomeNPILookupView()
 } else {
 XCTFail("Unknown entry point")
 }
 }

 private func handleWelcomeScreen() {
 XCTAssertTrue(app.images["MediBlockLogoStacked"].exists, "Logo should be visible on the welcome screen.")
 sleep(UInt32(3.5))  // Wait for any potential transitions
 handleOnboardingScreen()  // Assuming onboarding might follow the welcome screen
 }

 private func handleOnboardingScreen() {
 let getStartedButton = app.buttons["Get Started"]
 XCTAssertTrue(getStartedButton.exists, "Get Started button should be available on Onboarding Screen.")
 getStartedButton.tap()
 handleHomeNPILookupView()  // Assuming tapping 'Get Started' leads to the Home NPI Lookup View
 }

 private func handleHomeNPILookupView() {
 let npiTextField = app.textFields["Enter NPI Number"]
 XCTAssertTrue(npiTextField.exists, "NPI Text field should be accessible.")
 npiTextField.tap()
 npiTextField.typeText("1063456713")

 let fetchButton = app.buttons["Fetch Provider Details"]
 XCTAssertTrue(fetchButton.exists, "Fetch Provider Details button should be available.")
 fetchButton.tap()
 // Further navigation and testing logic here
 }
 }

 */

/*
 import XCTest

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

 // Delay to determine the current view
 sleep(3)

 if app.staticTexts["Digitizing medical identity...."].waitForExistence(timeout: 3) {
 handleWelcomeScreen(app: app)
 } else if app.buttons["Get Started"].waitForExistence(timeout: 3) {
 handleOnboardingScreen(app: app)
 } else if app.textFields["Enter NPI Number"].waitForExistence(timeout: 3) {
 handleHomeNPILookupView(app: app)
 } else {
 XCTFail("Unknown entry point")
 }
 }

 private func handleWelcomeScreen(app: XCUIApplication) {
 let logoImage = app.images["MediBlockLogoStacked"]
 XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen.")
 sleep(UInt32(3.5)) // Adjust based on your app's welcome screen display time
 handleOnboardingScreen(app: app) // Assuming onboarding might follow the welcome screen
 }

 private func handleOnboardingScreen(app: XCUIApplication) {
 let getStartedButton = app.buttons["Get Started"]
 XCTAssertTrue(getStartedButton.exists, "Get Started button should be available on Onboarding Screen.")
 getStartedButton.tap()
 handleHomeNPILookupView(app: app) // Assuming tapping 'Get Started' leads to the Home NPI Lookup View
 }

 private func handleHomeNPILookupView(app: XCUIApplication) {
 let npiTextField = app.textFields["Enter NPI Number"]
 XCTAssertTrue(npiTextField.exists, "NPI Text field should be accessible.")
 npiTextField.tap()
 npiTextField.typeText("1063456713")

 let fetchButton = app.buttons["Fetch Provider Details"]
 XCTAssertTrue(fetchButton.exists, "Fetch Provider Details button should be available.")
 fetchButton.tap()
 // Further navigation and testing logic here
 }
 }
 */

//most recent version below
import XCTest
@testable import hmCapstone

class AppEntryPointsTests: XCTestCase {
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

    // Delay to determine the current view
    sleep(3)

    if app.staticTexts["Digitizing medical identity...."].waitForExistence(timeout: 3) {
      handleWelcomeScreen(app: app)
    } else if app.buttons["Get Started"].waitForExistence(timeout: 3) {
      handleOnboardingScreen(app: app)
    } else if app.textFields["Enter NPI Number"].waitForExistence(timeout: 3) {
      handleHomeNPILookupView(app: app)
    } else {
      XCTFail("Unknown entry point")
    }
  }

  private func handleWelcomeScreen(app: XCUIApplication) {
    let logoImage = app.images["MediBlockLogoStacked"]
    XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen.")
    sleep(UInt32(3.5)) // Adjust based on your app's welcome screen display time
    handleOnboardingScreen(app: app) // Assuming onboarding might follow the welcome screen
  }

  private func handleOnboardingScreen(app: XCUIApplication) {
    let getStartedButton = app.buttons["Get Started"]
    XCTAssertTrue(getStartedButton.exists, "Get Started button should be available on Onboarding Screen.")
    getStartedButton.tap()
    handleHomeNPILookupView(app: app) // Assuming tapping 'Get Started' leads to the Home NPI Lookup View
  }

  private func handleHomeNPILookupView(app: XCUIApplication) {
    let npiTextField = app.textFields["Enter NPI Number"]
    XCTAssertTrue(npiTextField.exists, "NPI Text field should be accessible.")
    npiTextField.tap()
    npiTextField.typeText("1063456713")

    let fetchButton = app.buttons["Fetch Provider Details"]
    XCTAssertTrue(fetchButton.exists, "Fetch Provider Details button should be available.")
    fetchButton.tap()
    // Further navigation and testing logic here
  }
}

