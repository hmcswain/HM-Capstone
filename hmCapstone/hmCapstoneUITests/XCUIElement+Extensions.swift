import XCTest

extension XCUIElement {
    func waitForExistenceThenTap(timeout: TimeInterval) -> Bool {
        if self.waitForExistence(timeout: timeout) {
            self.tap()
            return true
        }
        return false
    }
}

