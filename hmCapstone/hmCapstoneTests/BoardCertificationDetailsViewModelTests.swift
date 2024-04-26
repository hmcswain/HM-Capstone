//
//  BoardCertificationDetailsViewModelTests.swift
//  hmCapstoneTests
//
//  Created by Jj on 4/25/24.
//
/*
 import XCTest

 final class BoardCertificationDetailsViewModelTests: XCTestCase {

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
class BoardCertificationDetailsViewModelTests: XCTestCase {
  var viewModel: BoardCertificationDetailsViewModel?
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
        viewModel = BoardCertificationDetailsViewModel(userDefaults: userDefaults)
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
   viewModel = BoardCertificationDetailsViewModel(userDefaults: userDefaults!)
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
    viewModel?.certifyingBoardName = "ABIM"
    await viewModel?.saveData()
    XCTAssertEqual(userDefaults?.string(forKey: "certifyingBoardName"), "ABIM", "Certifying Board Name should be saved")
    XCTAssertTrue(viewModel?.activeAlert == .saveAlert, "Save alert should be triggered")
  }

  func testClearData() async throws {
    userDefaults?.set("ABIM", forKey: "certifyingBoardName")
    await viewModel?.clearData()
    XCTAssertNil(userDefaults?.string(forKey: "certifyingBoardName"), "Certifying Board Name should be cleared")
    XCTAssertTrue(viewModel?.activeAlert == .clearAlert, "Clear alert should be triggered")
  }
}


