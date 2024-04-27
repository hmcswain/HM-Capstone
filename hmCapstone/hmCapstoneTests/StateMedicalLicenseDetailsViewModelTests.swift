//  StateMedicalLicenseDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class StateMedicalLicenseDetailsViewModelTests: XCTestCase {
  var viewModel: StateMedicalLicenseDetailsViewModel?
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
    viewModel = StateMedicalLicenseDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize StateMedicalLicenseDetailsViewModel.")
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
  func testSaveData() async {
    viewModel?.medicalBoardName = "Medical Board"
    await viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "medicalBoardName") else {
      XCTFail("Unable to retrieve saved medical board name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Medical Board", "Medical Board Name should be saved")
    XCTAssertTrue(viewModel?.activeAlert == .saveAlert, "Save alert should be triggered")
  }
  func testClearData() async {
    userDefaults?.set("Medical Board", forKey: "medicalBoardName")
    await viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "medicalBoardName")
    XCTAssertNil(savedName, "Medical Board Name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.activeAlert == .clearAlert, "Clear alert should be triggered")
  }
}
