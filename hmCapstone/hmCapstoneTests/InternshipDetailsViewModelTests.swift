//  InternshipDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class InternshipDetailsViewModelTests: XCTestCase {
  var viewModel: InternshipDetailsViewModel?
  var userDefaults: UserDefaults?
  var suiteName: String?
  override func setUpWithError() throws {
    try super.setUpWithError()
    suiteName = UUID().uuidString
    guard let suiteName = suiteName else {
      XCTFail("Failed to generate a unique suite name.")
      return
    }
    userDefaults = UserDefaults(suiteName: suiteName)
    guard let userDefaults = userDefaults else {
      XCTFail("Unable to initialize UserDefaults with suite name.")
      return
    }
    userDefaults.removePersistentDomain(forName: suiteName)
    viewModel = InternshipDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize InternshipDetailsViewModel.")
    }
  }
  override func tearDownWithError() throws {
    if let suiteName = suiteName {
      UserDefaults.standard.removeSuite(named: suiteName)
      userDefaults?.removePersistentDomain(forName: suiteName)
    }
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }
  func testSaveData() throws {
    viewModel?.internshipProgramName = "Example Program"
    viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "internshipProgramName") else {
      XCTFail("Unable to retrieve saved program name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Program", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() throws {
    userDefaults?.set("Example Program", forKey: "internshipProgramName")
    viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "internshipProgramName")
    XCTAssertNil(savedName, "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
