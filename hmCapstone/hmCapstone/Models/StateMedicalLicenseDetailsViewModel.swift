//  StateMedicalLicenseDetailsViewModel.swift

import Foundation

@MainActor
class StateMedicalLicenseDetailsViewModel: ObservableObject {
  @Published var medicalBoardName: String
  @Published var issuingState: String
  @Published var licenseNumber: String
  @Published var licenseExpirationDate: Date
  @Published var activeAlert: ActiveAlert?
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
    self.medicalBoardName = userDefaults.string(forKey: "medicalBoardName") ?? ""
    self.issuingState = userDefaults.string(forKey: "issuingState") ?? ""
    self.licenseNumber = userDefaults.string(forKey: "licenseNumber") ?? ""
    self.licenseExpirationDate = userDefaults.object(forKey: "licenseExpirationDate") as? Date ?? Date()
  }
  var daysUntilExpiration: Int {
    Calendar.current.dateComponents([.day], from: Date(), to: licenseExpirationDate).day ?? 0
  }
  func saveData() async {
    userDefaults.set(medicalBoardName, forKey: "medicalBoardName")
    userDefaults.set(issuingState, forKey: "issuingState")
    userDefaults.set(licenseNumber, forKey: "licenseNumber")
    userDefaults.set(licenseExpirationDate, forKey: "licenseExpirationDate")
    activeAlert = .saveAlert
  }
  func clearData() async {
    userDefaults.removeObject(forKey: "medicalBoardName")
    userDefaults.removeObject(forKey: "issuingState")
    userDefaults.removeObject(forKey: "licenseNumber")
    userDefaults.removeObject(forKey: "licenseExpirationDate")
    medicalBoardName = ""
    issuingState = ""
    licenseNumber = ""
    licenseExpirationDate = Date()
    activeAlert = .clearAlert
  }
}
