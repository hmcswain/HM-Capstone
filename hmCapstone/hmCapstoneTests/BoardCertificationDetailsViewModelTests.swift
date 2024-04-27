//  BoardCertificationDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class BoardCertificationDetailsViewModelTests: XCTestCase {
  var viewModel: BoardCertificationDetailsViewModel?
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
    viewModel = BoardCertificationDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize BoardCertificationDetailsViewModel.")
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
  func testSaveData() {
    viewModel?.certifyingBoardName = "ABIM"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "certifyingBoardName") else {
      XCTFail("Unable to retrieve saved certifying board name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "ABIM", "Certifying Board Name should be saved")
    XCTAssertTrue(viewModel?.activeAlert == .saveAlert, "Save alert should be triggered")
  }
  func testClearData() {
    userDefaults?.set("ABIM", forKey: "certifyingBoardName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "certifyingBoardName")
    XCTAssertNil(savedName, "Certifying Board Name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.activeAlert == .clearAlert, "Clear alert should be triggered")
  }
}
