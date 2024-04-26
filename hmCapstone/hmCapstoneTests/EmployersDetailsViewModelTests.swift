//
//  EmployersDetailsViewModelTests.swift
//  hmCapstoneTests
//
//  Created by Jj on 4/25/24.
//
/*
 import XCTest

 final class EmployersDetailsViewModelTests: XCTestCase {

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
final class EmployersDetailsViewModelTests: XCTestCase {
  var viewModel: EmployersDetailsViewModel?
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
        viewModel = EmployersDetailsViewModel(userDefaults: userDefaults)
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
   userDefaults = UserDefaults(suiteName: suiteName)
   userDefaults?.removePersistentDomain(forName: suiteName!)
   viewModel = EmployersDetailsViewModel(userDefaults: userDefaults!)
   }
   */
  override func tearDownWithError() throws {
    userDefaults?.removePersistentDomain(forName: suiteName!)
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }

  func testSaveData() async throws {
    viewModel?.employerName = "Example Employer"
    viewModel?.saveData()
    XCTAssertEqual(userDefaults?.string(forKey: "employerName"), "Example Employer", "The employer name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }

  func testClearData() async throws {
    userDefaults?.set("Example Employer", forKey: "employerName")
    viewModel?.clearData()
    XCTAssertNil(userDefaults?.string(forKey: "employerName"), "Employer name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}


