//  FellowshipDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class FellowshipDetailsViewModelTests: XCTestCase {
  var viewModel: FellowshipDetailsViewModel?
  var userDefaults: UserDefaults?
  var suiteName: String?
  override func setUpWithError() throws {
    try super.setUpWithError()
    suiteName = UUID().uuidString
    guard let suite = suiteName else {
      XCTFail("Failed to generate a unique suite name.")
      return
    }
    userDefaults = UserDefaults(suiteName: suite)
    guard let userDefaults = userDefaults else {
      XCTFail("Unable to initialize UserDefaults with suite name.")
      return
    }
    userDefaults.removePersistentDomain(forName: suite)
    viewModel = FellowshipDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize FellowshipDetailsViewModel.")
    }
  }
  override func tearDownWithError() throws {
    if let suite = suiteName {
      UserDefaults.standard.removeSuite(named: suite)
      userDefaults?.removePersistentDomain(forName: suite)
    }
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }
  func testSaveData() throws {
    viewModel?.fellowshipProgramName = "Example Program"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "fellowshipProgramName") else {
      XCTFail("Unable to retrieve saved program name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Program", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() throws {
    userDefaults?.set("Example Program", forKey: "fellowshipProgramName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "fellowshipProgramName")
    XCTAssertNil(savedName, "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
