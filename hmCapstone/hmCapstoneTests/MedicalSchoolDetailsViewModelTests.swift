//  MedicalSchoolDetailsViewModelTests.swift

import XCTest
@testable import hmCapstone

@MainActor
final class MedicalSchoolDetailsViewModelTests: XCTestCase {
  var viewModel: MedicalSchoolDetailsViewModel?
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
    viewModel = MedicalSchoolDetailsViewModel(userDefaults: userDefaults)
    if viewModel == nil {
      XCTFail("Failed to initialize MedicalSchoolDetailsViewModel.")
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
  func testSaveData() async throws {
    viewModel?.medicalSchoolName = "Example Medical School"
    await viewModel?.saveData()
    guard let savedName = userDefaults?.string(forKey: "medicalSchoolName") else {
      XCTFail("Unable to retrieve saved medical school name from UserDefaults.")
      return
    }
    XCTAssertEqual(savedName, "Example Medical School", "The medical school name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }
  func testClearData() async throws {
    userDefaults?.set("Example Medical School", forKey: "medicalSchoolName")
    await viewModel?.clearData()
    let savedName = userDefaults?.string(forKey: "medicalSchoolName")
    XCTAssertNil(savedName, "Medical school name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}
