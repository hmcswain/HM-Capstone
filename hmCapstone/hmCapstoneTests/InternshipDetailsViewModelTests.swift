//
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
    // Set up userDefaults with a unique suite name to isolate tests
    suiteName = UUID().uuidString
    if let suiteName = suiteName {
      userDefaults = UserDefaults(suiteName: suiteName)
      // Ensure userDefaults are clean before each test
      userDefaults?.removePersistentDomain(forName: suiteName)
      if let userDefaults = userDefaults {
        viewModel = InternshipDetailsViewModel(userDefaults: userDefaults)
      }
    }
    // If unable to setup properly, throw an error or handle the nil case appropriately
    if viewModel == nil || userDefaults == nil {
      XCTFail("Failed to initialize required components for the test.")
    }
  }



  /*
   override func setUpWithError() throws {
   try super.setUpWithError()
   // Set up userDefaults with a unique suite name to isolate tests
   suiteName = UUID().uuidString
   if let suiteName = suiteName {
   userDefaults = UserDefaults(suiteName: suiteName)
   // Ensure userDefaults are clean before each test
   userDefaults?.removePersistentDomain(forName: suiteName)
   viewModel = InternshipDetailsViewModel(userDefaults: userDefaults!)
   }
   }
   */

  override func tearDownWithError() throws {
    // Clear userDefaults after each test
    if let suiteName = suiteName {
      userDefaults?.removePersistentDomain(forName: suiteName)
      UserDefaults.standard.removeSuite(named: suiteName)
    }
    viewModel = nil
    userDefaults = nil
    try super.tearDownWithError()
  }

  func testSaveData() async throws {
    // Test save functionality
    viewModel?.internshipProgramName = "Example Program"
    await viewModel?.saveData()

    let savedName = userDefaults?.string(forKey: "internshipProgramName")
    XCTAssertEqual(savedName, "Example Program", "The program name should be saved in UserDefaults")
    XCTAssertTrue(viewModel?.showAlert ?? false, "Alert should be shown after saving")
  }

  func testClearData() async throws {
    // Test clear functionality
    userDefaults?.set("Example Program", forKey: "internshipProgramName")
    await viewModel?.clearData()

    let savedName = userDefaults?.string(forKey: "internshipProgramName")
    XCTAssertNil(savedName, "Program name should be cleared from UserDefaults")
    XCTAssertTrue(viewModel?.showClearAlert ?? false, "Clear alert should be shown after clearing data")
  }
}


/*
 @MainActor
 final class InternshipDetailsViewModelTests: XCTestCase {
 var viewModel: InternshipDetailsViewModel!
 var userDefaults: UserDefaults!
 var suiteName: String!

 override func setUpWithError() throws {
 try super.setUpWithError()
 // Set up userDefaults with a unique suite name to isolate tests
 suiteName = UUID().uuidString
 userDefaults = UserDefaults(suiteName: suiteName)!
 // Ensure userDefaults are clean before each test
 userDefaults.removePersistentDomain(forName: suiteName)
 viewModel = InternshipDetailsViewModel(userDefaults: userDefaults)
 }

 override func tearDownWithError() throws {
 // Clear userDefaults after each test
 userDefaults.removePersistentDomain(forName: suiteName)
 UserDefaults.standard.removeSuite(named: suiteName)
 viewModel = nil
 userDefaults = nil
 try super.tearDownWithError()
 }

 func testSaveData() async throws {
 // Test save functionality
 viewModel.internshipProgramName = "Example Program"
 await viewModel.saveData()

 XCTAssertEqual(userDefaults.string(forKey: "internshipProgramName"), "Example Program", "The program name should be saved in UserDefaults")
 XCTAssertTrue(viewModel.showAlert, "Alert should be shown after saving")
 }

 func testClearData() async throws {
 // Test clear functionality
 userDefaults.set("Example Program", forKey: "internshipProgramName")
 await viewModel.clearData()

 XCTAssertNil(userDefaults.string(forKey: "internshipProgramName"), "Program name should be cleared from UserDefaults")
 XCTAssertTrue(viewModel.showClearAlert, "Clear alert should be shown after clearing data")
 }
 }
 */

// old code below for tests
/*
 import XCTest
 @testable import hmCapstone

 @MainActor
 final class InternshipDetailsViewModelTests: XCTestCase {
 var viewModel: InternshipDetailsViewModel!
 var userDefaults: UserDefaults!

 override func setUpWithError() throws {
 try super.setUpWithError()
 // Manually dispatching to the main actor
 let expectation = XCTestExpectation(description: "SetUp Main Actor")
 Task { @MainActor in
 self.setupViewModel()
 expectation.fulfill()
 }
 wait(for: [expectation], timeout: 10.0)
 }

 override func tearDownWithError() throws {
 let expectation = XCTestExpectation(description: "TearDown Main Actor")
 Task { @MainActor in
 self.tearDownViewModel()
 expectation.fulfill()
 }
 wait(for: [expectation], timeout: 10.0)
 try super.tearDownWithError()
 }

 // Synchronously setting up the ViewModel
 private func setupViewModel() {
 let suiteName = UUID().uuidString
 userDefaults = UserDefaults(suiteName: suiteName)!
 viewModel = InternshipDetailsViewModel(userDefaults: userDefaults) // Assuming your ViewModel now takes UserDefaults as an initializer argument
 }

 // Synchronously tearing down the ViewModel
 private func tearDownViewModel() {
 UserDefaults().removePersistentDomain(forName: userDefaults.suiteName!)
 viewModel = nil
 }

 // Example tests...
 }

 /*
  final class InternshipDetailsViewModelTests: XCTestCase {
  var viewModel: InternshipDetailsViewModel!
  var userDefaults: UserDefaults!

  override func setUpWithError() throws {
  super.setUp()
  // Running setup under MainActor
  await setupViewModel()
  }

  override func tearDownWithError() throws {
  // Running teardown under MainActor
  await tearDownViewModel()
  super.tearDown()
  }

  // Helper function to setup ViewModel
  private func setupViewModel() async {
  let suiteName = UUID().uuidString
  userDefaults = UserDefaults(suiteName: suiteName)!
  viewModel = InternshipDetailsViewModel() // Assuming your ViewModel can now be correctly initialized
  }

  // Helper function to teardown ViewModel
  private func tearDownViewModel() async {
  userDefaults.removePersistentDomain(forName: userDefaults.suiteName!)
  userDefaults = nil
  viewModel = nil
  }
  */

 func testSaveData() async throws {
 // Test save functionality
 viewModel.internshipProgramName = "Example Program"
 await viewModel.saveData()

 XCTAssertEqual(userDefaults.string(forKey: "internshipProgramName"), "Example Program", "The program name should be saved in UserDefaults")
 XCTAssertTrue(viewModel.showAlert, "Alert should be shown after saving")
 }

 func testClearData() async throws {
 // Test clear functionality
 userDefaults.set("Example Program", forKey: "internshipProgramName")
 await viewModel.clearData()

 XCTAssertNil(userDefaults.string(forKey: "internshipProgramName"), "Program name should be cleared from UserDefaults")
 XCTAssertTrue(viewModel.showClearAlert, "Clear alert should be shown after clearing data")
 }
 }
 */

/*
 class InternshipDetailsViewModelTests: XCTestCase {
 var viewModel: InternshipDetailsViewModel!
 var userDefaults: UserDefaults!

 override func setUpWithError() throws {
 super.setUp()
 // Creating a mock instance of UserDefaults
 let suiteName = UUID().uuidString
 userDefaults = UserDefaults(suiteName: suiteName)!
 viewModel = InternshipDetailsViewModel()
 // Injecting mock UserDefaults instance if your viewModel supports dependency injection
 // Otherwise, you may need to override UserDefaults in your ViewModel directly
 }

 override func tearDownWithError() throws {
 userDefaults.removePersistentDomain(forName: userDefaults.suiteName!)
 userDefaults = nil
 viewModel = nil
 super.tearDown()
 }

 func testSaveData() async {
 viewModel.internshipProgramName = "Example Program"
 viewModel.programDirectorName = "John Doe"
 viewModel.acgmeInstitutionName = "Example Institution"
 viewModel.city = "Example City"
 viewModel.state = "Example State"

 await viewModel.saveData()

 XCTAssertEqual(userDefaults.string(forKey: "internshipProgramName"), "Example Program")
 XCTAssertEqual(userDefaults.string(forKey: "internshipProgramDirectorName"), "John Doe")
 XCTAssertEqual(userDefaults.string(forKey: "internshipAcgmeInstitutionName"), "Example Institution")
 XCTAssertEqual(userDefaults.string(forKey: "internshipCity"), "Example City")
 XCTAssertEqual(userDefaults.string(forKey: "internshipState"), "Example State")
 XCTAssertTrue(viewModel.showAlert, "Alert flag should be true after saving")
 }

 func testClearData() async {
 // First, set some data to clear
 userDefaults.set("Data", forKey: "internshipProgramName")
 userDefaults.set("Data", forKey: "internshipProgramDirectorName")
 userDefaults.set("Data", forKey: "internshipAcgmeInstitutionName")
 userDefaults.set("Data", forKey: "internshipCity")
 userDefaults.set("Data", forKey: "internshipState")

 await viewModel.clearData()

 XCTAssertNil(userDefaults.string(forKey: "internshipProgramName"))
 XCTAssertNil(userDefaults.string(forKey: "internshipProgramDirectorName"))
 XCTAssertNil(userDefaults.string(forKey: "internshipAcgmeInstitutionName"))
 XCTAssertNil(userDefaults.string(forKey: "internshipCity"))
 XCTAssertNil(userDefaults.string(forKey: "internshipState"))
 XCTAssertTrue(viewModel.showClearAlert, "Clear alert flag should be true after clearing")
 }
 }
 */

/*
 final class InternshipDetailsViewModelTests: XCTestCase {

 override func setUpWithError() throws {
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }

 override func tearDownWithError() throws {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 }

 func testExample() throws {
 // This is an example of a functional test case.
 // Use XCTAssert and related functions to verify your tests produce the correct results.
 // Any test you write for XCTest can be annotated as throws and async.
 // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
 // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
 }

 func testPerformanceExample() throws {
 // This is an example of a performance test case.
 self.measure {
 // Put the code you want to measure the time of here.
 }
 }

 }
 */
