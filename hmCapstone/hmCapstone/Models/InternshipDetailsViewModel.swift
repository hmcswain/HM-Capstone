//
//  InternshipDetailsViewModel.swift
//  hmCapstone
//
//  Created by Jj on 4/23/24.
//

import Foundation
import SwiftUI
/*
 class InternshipDetailsViewModel: ObservableObject {
 @Published var medicalSchoolName: String = UserDefaults.standard.string(forKey: "medicalSchoolName") ?? ""
 @Published var shortName: String = UserDefaults.standard.string(forKey: "shortName") ?? ""
 @Published var city: String = UserDefaults.standard.string(forKey: "city") ?? ""
 @Published var state: String = UserDefaults.standard.string(forKey: "state") ?? ""
 
 func saveData() {
 UserDefaults.standard.set(medicalSchoolName, forKey: "medicalSchoolName")
 UserDefaults.standard.set(shortName, forKey: "shortName")
 UserDefaults.standard.set(city, forKey: "city")
 UserDefaults.standard.set(state, forKey: "state")
 }
 
 func clearData() {
 UserDefaults.standard.removeObject(forKey: "medicalSchoolName")
 UserDefaults.standard.removeObject(forKey: "shortName")
 UserDefaults.standard.removeObject(forKey: "city")
 UserDefaults.standard.removeObject(forKey: "state")
 medicalSchoolName = ""
 shortName = ""
 city = ""
 state = ""
 }
 }
 */
/*
 import Foundation
 
 class InternshipDetailsViewModel: ObservableObject {
 @Published var internshipProgramName: String = UserDefaults.standard.string(forKey: "internshipProgramName") ?? ""
 @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "programDirectorName") ?? ""
 @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "acgmeInstitutionName") ?? ""
 @Published var city: String = UserDefaults.standard.string(forKey: "city") ?? ""
 @Published var state: String = UserDefaults.standard.string(forKey: "state") ?? ""
 
 func saveData() {
 UserDefaults.standard.set(internshipProgramName, forKey: "internshipProgramName")
 UserDefaults.standard.set(programDirectorName, forKey: "programDirectorName")
 UserDefaults.standard.set(acgmeInstitutionName, forKey: "acgmeInstitutionName")
 UserDefaults.standard.set(city, forKey: "city")
 UserDefaults.standard.set(state, forKey: "state")
 }
 
 func clearData() {
 UserDefaults.standard.removeObject(forKey: "internshipProgramName")
 UserDefaults.standard.removeObject(forKey: "programDirectorName")
 UserDefaults.standard.removeObject(forKey: "acgmeInstitutionName")
 UserDefaults.standard.removeObject(forKey: "city")
 UserDefaults.standard.removeObject(forKey: "state")
 internshipProgramName = ""
 programDirectorName = ""
 acgmeInstitutionName = ""
 city = ""
 state = ""
 }
 }
 
 */

import Foundation

class InternshipDetailsViewModel: ObservableObject {
  @Published var internshipProgramName: String = UserDefaults.standard.string(forKey: "internshipProgramName") ?? ""
  @Published var programDirectorName: String = UserDefaults.standard.string(forKey: "internshipProgramDirectorName") ?? ""
  @Published var acgmeInstitutionName: String = UserDefaults.standard.string(forKey: "internshipAcgmeInstitutionName") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "internshipCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "internshipState") ?? ""
  @Published var showAlert: Bool = false
  @Published var showClearAlert: Bool = false

  func saveData() {
    UserDefaults.standard.set(internshipProgramName, forKey: "internshipProgramName")
    UserDefaults.standard.set(programDirectorName, forKey: "internshipProgramDirectorName")
    UserDefaults.standard.set(acgmeInstitutionName, forKey: "internshipAcgmeInstitutionName")
    UserDefaults.standard.set(city, forKey: "internshipCity")
    UserDefaults.standard.set(state, forKey: "internshipState")
    showAlert = true
  }
  
  func clearData() {
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

