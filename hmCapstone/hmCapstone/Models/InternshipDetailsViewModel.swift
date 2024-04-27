//  InternshipDetailsViewModel.swift

import Foundation
import SwiftUI

@MainActor
class InternshipDetailsViewModel: ObservableObject {
  @Published var internshipProgramName: String
  @Published var programDirectorName: String
  @Published var acgmeInstitutionName: String
  @Published var city: String
  @Published var state: String
  @Published var showAlert = false
  @Published var showClearAlert = false
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
    self.internshipProgramName = userDefaults.string(forKey: "internshipProgramName") ?? ""
    self.programDirectorName = userDefaults.string(forKey: "internshipProgramDirectorName") ?? ""
    self.acgmeInstitutionName = userDefaults.string(forKey: "internshipAcgmeInstitutionName") ?? ""
    self.city = userDefaults.string(forKey: "internshipCity") ?? ""
    self.state = userDefaults.string(forKey: "internshipState") ?? ""
  }
  func saveData() {
    userDefaults.set(internshipProgramName, forKey: "internshipProgramName")
    userDefaults.set(programDirectorName, forKey: "internshipProgramDirectorName")
    userDefaults.set(acgmeInstitutionName, forKey: "internshipAcgmeInstitutionName")
    userDefaults.set(city, forKey: "internshipCity")
    userDefaults.set(state, forKey: "internshipState")
    showAlert = true
  }
  func clearData() {
    userDefaults.removeObject(forKey: "internshipProgramName")
    userDefaults.removeObject(forKey: "internshipProgramDirectorName")
    userDefaults.removeObject(forKey: "internshipAcgmeInstitutionName")
    userDefaults.removeObject(forKey: "internshipCity")
    userDefaults.removeObject(forKey: "internshipState")
    internshipProgramName = ""
    programDirectorName = ""
    acgmeInstitutionName = ""
    city = ""
    state = ""
    showClearAlert = true
  }
}
