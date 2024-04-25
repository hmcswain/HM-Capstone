//
//  InternshipDetailsViewModel.swift
//  hmCapstone
//

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
