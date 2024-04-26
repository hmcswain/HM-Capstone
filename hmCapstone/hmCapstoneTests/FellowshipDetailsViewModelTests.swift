//
//  FellowshipDetailsViewModelTests.swift
//  hmCapstoneTests
//
//  Created by Jj on 4/25/24.
//
/*
 import XCTest

 final class FellowshipDetailsViewModelTests: XCTestCase {

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
final class FellowshipDetailsViewModelTests: XCTestCase {
  var viewModel: FellowshipDetailsViewModel?
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
        viewModel = FellowshipDetailsViewModel(userDefaults: userDefaults)
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
   viewModel = FellowshipDetailsViewModel(userDefaults: userDefaults!)
   }
   */
  override func tearDownWithError() throws {
    if let suiteName = suiteName {
      UserDefaults.standard.removeSuite(named: suiteName)
    }
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }

  func testSaveData() async throws {
    viewModel?.fellowshipProgramName = "Example Program"
    await viewModel?.saveData()

    XCTAssertEqual(userDefaults?.string(forKey: "fellowshipProgramName"), "Example Program", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }

  func testClearData() async throws {
    userDefaults?.set("Example Program", forKey: "fellowshipProgramName")
    await viewModel?.clearData()

    XCTAssertNil(userDefaults?.string(forKey: "fellowshipProgramName"), "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
