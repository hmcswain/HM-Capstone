//  HospitalAffiliationsDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class HospitalAffiliationsViewModelTests: XCTestCase {
  var viewModel: HospitalAffiliationsDetailsViewModel?
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
    viewModel = HospitalAffiliationsDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize HospitalAffiliationsDetailsViewModel.")
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
    viewModel?.hospitalName = "Example Hospital"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "hospitalName") else {
      XCTFail("Unable to retrieve saved hospital name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Hospital", "The hospital name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() throws {
    userDefaults?.set("Example Hospital", forKey: "hospitalName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "hospitalName")
    XCTAssertNil(savedName, "Hospital name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
