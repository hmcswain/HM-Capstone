//  BoardCertificationDetailsViewModel.swift

import Foundation

@MainActor
class BoardCertificationDetailsViewModel: ObservableObject {
  @Published var certifyingBoardName: String
  @Published var specialtyName: String
  @Published var certificateExpirationDate: Date
  @Published var activeAlert: ActiveAlert?
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
    self.certifyingBoardName = userDefaults.string(forKey: "certifyingBoardName") ?? ""
    self.specialtyName = userDefaults.string(forKey: "specialtyName") ?? ""
    self.certificateExpirationDate = userDefaults.object(forKey: "certificateExpirationDate") as? Date ?? Date()
  }
  var daysUntilExpiration: Int {
    Calendar.current.dateComponents([.day], from: Date(), to: certificateExpirationDate).day ?? 0
  }
  func saveData() {
    userDefaults.set(certifyingBoardName, forKey: "certifyingBoardName")
    userDefaults.set(specialtyName, forKey: "specialtyName")
    userDefaults.set(certificateExpirationDate, forKey: "certificateExpirationDate")
    activeAlert = .saveAlert
  }
  func clearData() {
    certifyingBoardName = ""
    specialtyName = ""
    certificateExpirationDate = Date()
    userDefaults.removeObject(forKey: "certifyingBoardName")
    userDefaults.removeObject(forKey: "specialtyName")
    userDefaults.removeObject(forKey: "certificateExpirationDate")
    activeAlert = .clearAlert
  }
}
