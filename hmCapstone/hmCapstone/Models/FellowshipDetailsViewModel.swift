//  FellowshipDetailsViewModel.swift

import Foundation

@MainActor
class FellowshipDetailsViewModel: ObservableObject {
  @Published var fellowshipProgramName: String
  @Published var programDirectorName: String
  @Published var acgmeInstitutionName: String
  @Published var city: String
  @Published var state: String
  @Published var showAlert = false
  @Published var showClearAlert = false
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
    fellowshipProgramName = userDefaults.string(forKey: "fellowshipProgramName") ?? ""
    programDirectorName = userDefaults.string(forKey: "fellowshipProgramDirectorName") ?? ""
    acgmeInstitutionName = userDefaults.string(forKey: "fellowshipAcgmeInstitutionName") ?? ""
    city = userDefaults.string(forKey: "fellowshipCity") ?? ""
    state = userDefaults.string(forKey: "fellowshipState") ?? ""
  }
  func saveData() {
    userDefaults.set(fellowshipProgramName, forKey: "fellowshipProgramName")
    userDefaults.set(programDirectorName, forKey: "fellowshipProgramDirectorName")
    userDefaults.set(acgmeInstitutionName, forKey: "fellowshipAcgmeInstitutionName")
    userDefaults.set(city, forKey: "fellowshipCity")
    userDefaults.set(state, forKey: "fellowshipState")
    showAlert = true
  }
  func clearData() {
    userDefaults.removeObject(forKey: "fellowshipProgramName")
    userDefaults.removeObject(forKey: "fellowshipProgramDirectorName")
    userDefaults.removeObject(forKey: "fellowshipAcgmeInstitutionName")
    userDefaults.removeObject(forKey: "fellowshipCity")
    userDefaults.removeObject(forKey: "fellowshipState")
    fellowshipProgramName = ""
    programDirectorName = ""
    acgmeInstitutionName = ""
    city = ""
    state = ""
    showClearAlert = true
  }
}
