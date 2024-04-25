//
//  PrivateDataViewUITests.swift
//  HmCapstoneUITests
//
//  Created by Jj on 4/25/24.
//
/*
import XCTest

final class PrivateDataViewUITests: XCTestCase {

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

class PrivateDataViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        // Navigate to the view if it's not the initial view
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSocialSecurityVisibilityToggle() {
        let ssnField = app.secureTextFields["Enter SSN-9 digits only, no dashes"]
        let visibilityButton = app.buttons["eye.slash"]  // Assuming it starts as hidden

        XCTAssertTrue(ssnField.exists)
        visibilityButton.tap()
        XCTAssertTrue(app.textFields["Enter SSN-9 digits only, no dashes"].exists)
    }

    func testSaveDetailsFunctionality() {
        let saveButton = app.buttons["Save Details"]
        let birthDatePicker = app.datePickers["Select your date of birth"]

        birthDatePicker.tap()
        birthDatePicker.pickerWheels.element.adjust(toPickerWheelValue: "January 1")

        saveButton.tap()
        XCTAssertTrue(app.alerts["Data has been successfully saved to your device."].exists)
    }

    func testClearDetailsFunctionality() {
        let clearButton = app.buttons["Clear Details"]
        clearButton.tap()
        XCTAssertTrue(app.alerts["All data fields in this section have been cleared."].exists)
    }

    func testEmailFieldInput() {
        let emailTextField = app.textFields["Enter your email"]
        emailTextField.tap()
        emailTextField.typeText("example@test.com")
        XCTAssert(app.textFields["example@test.com"].exists)
    }

    func testCellPhoneFieldInput() {
        let phoneTextField = app.textFields["Enter your cell number-no dashes or ()"]
        phoneTextField.tap()
        phoneTextField.typeText("1234567890")
        XCTAssert(app.textFields["1234567890"].exists)
    }
}

*/



/*
import XCTest
@testable import hmCapstone  // Allows the test cases access to the internal elements of your app module

class PrivateDataViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testSocialSecurityVisibilityToggle() {
        let ssnField = app.secureTextFields["ssnField"]
        let visibilityButton = app.buttons["ssnVisibilityToggle"]

        XCTAssertTrue(ssnField.exists)
        visibilityButton.tap()
        XCTAssertTrue(app.textFields["ssnField"].exists) // Note: Adjust this if the text field also changes identifiers when visible.
    }

    func testDatePickerInteraction() {
        let datePicker = app.datePickers["dateOfBirthPicker"]
        XCTAssertTrue(datePicker.exists)
        datePicker.tap()
        datePicker.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "January 1")
        datePicker.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "2000")
    }
/*
    func testSaveAndClearButtons() {
        let saveButton = app.buttons["Save Details"]
        let clearButton = app.buttons["Clear Details"]

        XCTAssertTrue(saveButton.exists)
        XCTAssertTrue(clearButton.exists)

        saveButton.tap()
        XCTAssertTrue(app.alerts["Data has been successfully saved to your device."].exists)

        clearButton.tap()
        XCTAssertTrue(app.alerts["All data fields in this section have been cleared."].exists)
    }
*/
    func testSaveAndClearButtons() {
      let app = XCUIApplication()
      app.launch()

      let saveButton = app.buttons["saveDetailsButton"]
      let clearButton = app.buttons["clearDetailsButton"]

      XCTAssertTrue(saveButton.exists)
      XCTAssertTrue(clearButton.exists)

      saveButton.tap()
      let saveAlert = app.alerts["Data has been successfully saved to your device."]
      let saveAlertExists = saveAlert.waitForExistence(timeout: 5)
      XCTAssertTrue(saveAlertExists, "Save alert did not appear")

      if saveAlertExists {
          saveAlert.buttons["OK"].tap()
      }

      clearButton.tap()
      let clearAlert = app.alerts["All data fields in this section have been cleared."]
      let clearAlertExists = clearAlert.waitForExistence(timeout: 5)
      XCTAssertTrue(clearAlertExists, "Clear alert did not appear")

      if clearAlertExists {
          clearAlert.buttons["OK"].tap()
      }
  }


    // Add additional tests as needed
}

*/
