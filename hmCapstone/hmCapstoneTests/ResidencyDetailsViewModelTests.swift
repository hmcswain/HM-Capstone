//  ResidencyDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class ResidencyDetailsViewModelTests: XCTestCase {
  var viewModel: ResidencyDetailsViewModel?
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
    viewModel = ResidencyDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize ResidencyDetailsViewModel.")
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
    viewModel?.residencyProgramName = "Example Program"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "residencyProgramName") else {
      XCTFail("Unable to retrieve saved program name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Program", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() throws {
    userDefaults?.set("Example Program", forKey: "residencyProgramName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "residencyProgramName")
    XCTAssertNil(savedName, "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
