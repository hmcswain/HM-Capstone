//  ResidencyDetailsViewModel.swift

import Foundation

@MainActor
class ResidencyDetailsViewModel: ObservableObject {
  @Published var residencyProgramName: String
  @Published var programDirectorName: String
  @Published var acgmeInstitutionName: String
  @Published var city: String
  @Published var state: String
  @Published var showAlert = false
  @Published var showClearAlert = false
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
    self.residencyProgramName = userDefaults.string(forKey: "residencyProgramName") ?? ""
    self.programDirectorName = userDefaults.string(forKey: "residencyProgramDirectorName") ?? ""
    self.acgmeInstitutionName = userDefaults.string(forKey: "residencyAcgmeInstitutionName") ?? ""
    self.city = userDefaults.string(forKey: "residencyCity") ?? ""
    self.state = userDefaults.string(forKey: "residencyState") ?? ""
  }
  func saveData() {
    userDefaults.set(residencyProgramName, forKey: "residencyProgramName")
    userDefaults.set(programDirectorName, forKey: "residencyProgramDirectorName")
    userDefaults.set(acgmeInstitutionName, forKey: "residencyAcgmeInstitutionName")
    userDefaults.set(city, forKey: "residencyCity")
    userDefaults.set(state, forKey: "residencyState")
    showAlert = true
  }
  func clearData() {
    userDefaults.removeObject(forKey: "residencyProgramName")
    userDefaults.removeObject(forKey: "residencyProgramDirectorName")
    userDefaults.removeObject(forKey: "residencyAcgmeInstitutionName")
    userDefaults.removeObject(forKey: "residencyCity")
    userDefaults.removeObject(forKey: "residencyState")
    residencyProgramName = ""
    programDirectorName = ""
    acgmeInstitutionName = ""
    city = ""
    state = ""
    showClearAlert = true
  }
}
