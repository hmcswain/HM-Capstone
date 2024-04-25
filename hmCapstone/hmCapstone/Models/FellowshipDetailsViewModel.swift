//
//  FellowshipDetailsViewModel.swift
//  hmCapstone
//

import Foundation

@MainActor
class FellowshipDetailsViewModel: ObservableObject {
  @Published var fellowshipProgramName: String = UserDefaults.standard.string(forKey: "fellowshipProgramName") ?? ""
  @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "fellowshipProgramDirectorName") ?? ""
  @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "fellowshipAcgmeInstitutionName") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "fellowshipCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "fellowshipState") ?? ""
  @Published var showAlert = false
  @Published var showClearAlert = false

  func saveData() async {
    UserDefaults.standard.set(fellowshipProgramName, forKey: "fellowshipProgramName")
    UserDefaults.standard.set(programDirectorName, forKey: "fellowshipProgramDirectorName")
    UserDefaults.standard.set(acgmeInstitutionName, forKey: "fellowshipAcgmeInstitutionName")
    UserDefaults.standard.set(city, forKey: "fellowshipCity")
    UserDefaults.standard.set(state, forKey: "fellowshipState")
    showAlert = true
  }

  func clearData() async {
    UserDefaults.standard.removeObject(forKey: "fellowshipProgramName")
    UserDefaults.standard.removeObject(forKey: "fellowshipProgramDirectorName")
    UserDefaults.standard.removeObject(forKey: "fellowshipAcgmeInstitutionName")
    UserDefaults.standard.removeObject(forKey: "fellowshipCity")
    UserDefaults.standard.removeObject(forKey: "fellowshipState")
    fellowshipProgramName = ""
    programDirectorName = ""
    acgmeInstitutionName = ""
    city = ""
    state = ""
    showClearAlert = true
  }
}
