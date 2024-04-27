//  NPIDetailViewUITests.swift

import XCTest
@testable import hmCapstone

class CompleteUITests: XCTestCase {
  var app: XCUIApplication?
  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app?.launch()
  }
  func testCompleteFlowFromLaunchToNPIDetails() throws {
    guard let app = app else {
      XCTFail("Failed to initialize XCUIApplication.")
      return
    }
    let logoImage = app.images["MediBlockLogoStacked"]
    if logoImage.exists {
      XCTAssertTrue(logoImage.exists, "Logo should be visible on the welcome screen")
      sleep(3)
    }
    let getStartedButton = app.buttons["Get Started"]
    if getStartedButton.waitForExistence(timeout: 5) {
      getStartedButton.tap()
    } else {
      XCTFail("Get Started button did not appear")
    }
    let npiTextField = app.textFields["Enter NPI Number"]
    XCTAssert(npiTextField.waitForExistence(timeout: 5), "NPI Text field should be available after onboarding")
    npiTextField.tap()
    npiTextField.typeText("1063456713")
    let fetchButton = app.buttons["Fetch Provider Details"]
    fetchButton.tap()
    let exists = NSPredicate(format: "exists == 1")
    let publicDataTab = app.tabBars.buttons["Public Data"]
    expectation(for: exists, evaluatedWith: publicDataTab, handler: nil)
    waitForExpectations(timeout: 30, handler: nil)
    let npiDetailsButton = app.buttons["NPI Details"]
    if npiDetailsButton.waitForExistence(timeout: 10) {
      npiDetailsButton.tap()
      let npiNumberLabel = app.staticTexts["NavigateToNPI-1063456713"]
      XCTAssertTrue(npiNumberLabel.exists, "NPI Number label should be visible on NPI Detail View")
      let providerNameLabel = app.staticTexts["Provider Full Name"]
      XCTAssertTrue(providerNameLabel.exists, "Provider Full Name label should be visible")
      let providerName = app.staticTexts["Hugh McSwain"]
      XCTAssertTrue(providerName.exists, "Provider's name should be displayed on NPI Details page")
    }
  }
  override func tearDownWithError() throws {
    app = nil
  }
}
