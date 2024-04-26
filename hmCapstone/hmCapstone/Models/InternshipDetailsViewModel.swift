//
//  InternshipDetailsViewModel.swift


//below is working code commented out to try test of init for userdefaults
/*
 import Foundation
 import SwiftUI
 
 @MainActor
 class InternshipDetailsViewModel: ObservableObject {
 @Published var internshipProgramName: String = UserDefaults.standard.string(forKey: "internshipProgramName") ?? ""
 @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "internshipProgramDirectorName") ?? ""
 @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "internshipAcgmeInstitutionName") ?? ""
 @Published var city: String = UserDefaults.standard.string(forKey: "internshipCity") ?? ""
 @Published var state: String = UserDefaults.standard.string(forKey: "internshipState") ?? ""
 @Published var showAlert = false
 @Published var showClearAlert = false
 
 func saveData() async {
 UserDefaults.standard.set(internshipProgramName, forKey: "internshipProgramName")
 UserDefaults.standard.set(programDirectorName, forKey: "internshipProgramDirectorName")
 UserDefaults.standard.set(acgmeInstitutionName, forKey: "internshipAcgmeInstitutionName")
 UserDefaults.standard.set(city, forKey: "internshipCity")
 UserDefaults.standard.set(state, forKey: "internshipState")
 showAlert = true
 }
 
 func clearData() async {
 UserDefaults.standard.removeObject(forKey: "internshipProgramName")
 UserDefaults.standard.removeObject(forKey: "internshipProgramDirectorName")
 UserDefaults.standard.removeObject(forKey: "internshipAcgmeInstitutionName")
 UserDefaults.standard.removeObject(forKey: "internshipCity")
 UserDefaults.standard.removeObject(forKey: "internshipState")
 internshipProgramName = ""
 programDirectorName = ""
 acgmeInstitutionName = ""
 city = ""
 state = ""
 showClearAlert = true
 }
 }
 */

// below is test code to initialize userdefaults

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
  
  // Adjust the initializer to accept a UserDefaults instance
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

