//  ActiveAlertTests.swift

import XCTest
@testable import hmCapstone

class ActiveAlertTests: XCTestCase {
  func testActiveAlertSaveAlertHasCorrectId() {
    let alert = ActiveAlert.saveAlert
    XCTAssertEqual(alert.id, 1, "SaveAlert should have an id of 1")
  }
  func testActiveAlertClearAlertHasCorrectId() {
    let alert = ActiveAlert.clearAlert
    XCTAssertEqual(alert.id, 2, "ClearAlert should have an id of 2")
  }
  func testActiveAlertNoneHasCorrectId() {
    let alert = ActiveAlert.none
    XCTAssertEqual(alert.id, 0, "None should have an id of 0")
  }
}
