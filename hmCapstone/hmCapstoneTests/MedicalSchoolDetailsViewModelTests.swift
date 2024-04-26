//
//  MedicalSchoolDetailsViewModelTests.swift
//  hmCapstoneTests
//
//  Created by Jj on 4/25/24.
//

/*
 import XCTest

 final class MedicalSchoolDetailsViewModelTests: XCTestCase {

 override func setUpWithError() throws {
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }

 override func tearDownWithError() throws {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 }

 func testExample() throws {
 // This is an example of a functional test case.
 // Use XCTAssert and related functions to verify your tests produce the correct results.
 // Any test you write for XCTest can be annotated as throws and async.
 // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
 // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
 }

 func testPerformanceExample() throws {
 // This is an example of a performance test case.
 self.measure {
 // Put the code you want to measure the time of here.
 }
 }

 }
 */
import XCTest
@testable import hmCapstone

@MainActor
class MedicalSchoolDetailsViewModelTests: XCTestCase {
  var viewModel: MedicalSchoolDetailsViewModel?
  var userDefaults: UserDefaults?
  var suiteName: String?

  override func setUpWithError() throws {
    try super.setUpWithError()
    // Set up userDefaults with a unique suite name to isolate tests
    suiteName = UUID().uuidString
    if let suiteName = suiteName {
      userDefaults = UserDefaults(suiteName: suiteName)
      // Ensure userDefaults are clean before each test
      userDefaults?.removePersistentDomain(forName: suiteName)
      if let userDefaults = userDefaults {
        viewModel = MedicalSchoolDetailsViewModel(userDefaults: userDefaults)
      }
    }
    // If unable to setup properly, throw an error or handle the nil case appropriately
    if viewModel == nil || userDefaults == nil {
      XCTFail("Failed to initialize required components for the test.")
    }
  }

  /*
   override func setUpWithError() throws {
   try super.setUpWithError()
   suiteName = UUID().uuidString
   if let suiteName = suiteName {
   userDefaults = UserDefaults(suiteName: suiteName)
   userDefaults?.removePersistentDomain(forName: suiteName)
   viewModel = MedicalSchoolDetailsViewModel(userDefaults: userDefaults!)
   }
   XCTAssertNotNil(viewModel, "ViewModel should not be nil")
   }
   */

  override func tearDownWithError() throws {
    if let suiteName = suiteName {
      userDefaults?.removePersistentDomain(forName: suiteName)
      UserDefaults.standard.removeSuite(named: suiteName)
    }
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }
  func testSaveData() async throws {
    // Test save functionality
    viewModel?.medicalSchoolName = "Example Medical School"
    await viewModel?.saveData()

    let savedName = userDefaults?.string(forKey: "medicalSchoolName")
    XCTAssertEqual(savedName, "Example Medical School", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }

  func testClearData() async throws {
    // Test clear functionality
    userDefaults?.set("Example Medical School", forKey: "medicalSchoolName")
    await viewModel?.clearData()

    let savedName = userDefaults?.string(forKey: "medicalSchoolName")
    XCTAssertNil(savedName, "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
/*
  func testSaveData() async throws {
    viewModel?.medicalSchoolName = "Example Medical School"
    await viewModel?.saveData()
    XCTAssertEqual(userDefaults?.string(forKey: "medicalSchoolName"), "Example Medical School", "Medical School Name should be saved")
    XCTAssertTrue(viewModel?.showAlert, "Save alert should be triggered")
  }

  func testClearData() async throws {
    userDefaults?.set("Example Medical School", forKey: "medicalSchoolName")
    await viewModel?.clearData()
    XCTAssertNil(userDefaults?.string(forKey: "medicalSchoolName"), "Medical School Name should be cleared")
    XCTAssertTrue(viewModel?.showClearAlert, "Clear alert should be triggered")
  }
*/


