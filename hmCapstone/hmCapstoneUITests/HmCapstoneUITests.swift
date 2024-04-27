//  HmCapstoneUITests.swift

import XCTest
@testable import hmCapstone

final class HmCapstoneUITests: XCTestCase {
  var app: XCUIApplication?
  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app?.terminate()
  }
  override func tearDownWithError() throws {
    app?.terminate()
    app = nil
  }
  func testExample() throws {
    guard let app = app else {
      XCTFail("XCUIApplication is not initialized")
      return
    }
    app.launchArguments += ["-UITesting", "-DisableComplexFeatures"]
    app.launch()
  }
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        guard let app = self.app else {
          XCTFail("XCUIApplication is not initialized")
          return
        }
        app.launchArguments += ["-UITesting", "-DisableComplexFeatures"]
        app.launch()
        app.terminate()
      }
    }
  }
}
