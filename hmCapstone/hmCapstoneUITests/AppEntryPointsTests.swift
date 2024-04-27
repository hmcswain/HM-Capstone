//  AppEntryPointsTests.swift

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
    sleep(UInt32(3.5))
    handleOnboardingScreen(app: app)
  }
  private func handleOnboardingScreen(app: XCUIApplication) {
    let getStartedButton = app.buttons["Get Started"]
    XCTAssertTrue(getStartedButton.exists, "Get Started button should be available on Onboarding Screen.")
    getStartedButton.tap()
    handleHomeNPILookupView(app: app)
  }
  private func handleHomeNPILookupView(app: XCUIApplication) {
    let npiTextField = app.textFields["Enter NPI Number"]
    XCTAssertTrue(npiTextField.exists, "NPI Text field should be accessible.")
    npiTextField.tap()
    npiTextField.typeText("1063456713")

    let fetchButton = app.buttons["Fetch Provider Details"]
    XCTAssertTrue(fetchButton.exists, "Fetch Provider Details button should be available.")
    fetchButton.tap()
  }
}
