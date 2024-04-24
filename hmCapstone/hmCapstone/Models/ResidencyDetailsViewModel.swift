//
//  ResidencyDetailsViewModel.swift
//  hmCapstone
//
/*
 import Foundation

 class ResidencyDetailsViewModel: ObservableObject {
 @Published var residencyProgramName: String = UserDefaults.standard.string(forKey: "residencyProgramName") ?? ""
 @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "residencyProgramDirectorName") ?? ""
 @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "residencyAcgmeInstitutionName") ?? ""
 @Published var city: String = UserDefaults.standard.string(forKey: "residencyCity") ?? ""
 @Published var state: String = UserDefaults.standard.string(forKey: "residencyState") ?? ""

 func saveData() {
 UserDefaults.standard.set(residencyProgramName, forKey: "residencyProgramName")
 UserDefaults.standard.set(programDirectorName, forKey: "residencyProgramDirectorName")
 UserDefaults.standard.set(acgmeInstitutionName, forKey: "residencyAcgmeInstitutionName")
 UserDefaults.standard.set(city, forKey: "residencyCity")
 UserDefaults.standard.set(state, forKey: "residencyState")
 }

 func clearData() {
 UserDefaults.standard.removeObject(forKey: "residencyProgramName")
 UserDefaults.standard.removeObject(forKey: "residencyProgramDirectorName")
 UserDefaults.standard.removeObject(forKey: "residencyAcgmeInstitutionName")
 UserDefaults.standard.removeObject(forKey: "residencyCity")
 UserDefaults.standard.removeObject(forKey: "residencyState")
 residencyProgramName = ""
 programDirectorName = ""
 acgmeInstitutionName = ""
 city = ""
 state = ""
 }
 }

 */

import Foundation

class ResidencyDetailsViewModel: ObservableObject {
  @Published var residencyProgramName: String = UserDefaults.standard.string(forKey: "residencyProgramName") ?? ""
  @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "residencyProgramDirectorName") ?? ""
  @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "residencyAcgmeInstitutionName") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "residencyCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "residencyState") ?? ""
  @Published var showAlert: Bool = false

  func saveData() {
    UserDefaults.standard.set(residencyProgramName, forKey: "residencyProgramName")
    UserDefaults.standard.set(programDirectorName, forKey: "residencyProgramDirectorName")
    UserDefaults.standard.set(acgmeInstitutionName, forKey: "residencyAcgmeInstitutionName")
    UserDefaults.standard.set(city, forKey: "residencyCity")
    UserDefaults.standard.set(state, forKey: "residencyState")
    showAlert = true
  }

  func clearData() {
    UserDefaults.standard.removeObject(forKey: "residencyProgramName")
    UserDefaults.standard.removeObject(forKey: "residencyProgramDirectorName")
    UserDefaults.standard.removeObject(forKey: "residencyAcgmeInstitutionName")
    UserDefaults.standard.removeObject(forKey: "residencyCity")
    UserDefaults.standard.removeObject(forKey: "residencyState")
    residencyProgramName = ""
    programDirectorName = ""
    acgmeInstitutionName = ""
    city = ""
    state = ""
  }
}

