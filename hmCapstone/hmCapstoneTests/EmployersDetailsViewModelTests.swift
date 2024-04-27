//  EmployersDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class EmployersDetailsViewModelTests: XCTestCase {
  var viewModel: EmployersDetailsViewModel?
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
    viewModel = EmployersDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize EmployersDetailsViewModel.")
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
    viewModel?.employerName = "Example Employer"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "employerName") else {
      XCTFail("Unable to retrieve saved employer name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Employer", "The employer name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() throws {
    userDefaults?.set("Example Employer", forKey: "employerName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "employerName")
    XCTAssertNil(savedName, "Employer name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
