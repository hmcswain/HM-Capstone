//
//  MedicalSchoolDetailsViewModel.swift
//  hmCapstone
//

// old working code here
/*
 import Foundation

 @MainActor
 class MedicalSchoolDetailsViewModel: ObservableObject {
 @Published var medicalSchoolName: String = UserDefaults.standard.string(forKey: "medicalSchoolName") ?? ""
 @Published var shortName: String = UserDefaults.standard.string(forKey: "medicalSchoolShortName") ?? ""
 @Published var streetAddress1: String = UserDefaults.standard.string(forKey: "medicalSchoolStreetAddress1") ?? ""
 @Published var streetAddress2: String = UserDefaults.standard.string(forKey: "medicalSchoolStreetAddress2") ?? ""
 @Published var city: String = UserDefaults.standard.string(forKey: "medicalSchoolCity") ?? ""
 @Published var state: String = UserDefaults.standard.string(forKey: "medicalSchoolState") ?? ""
 @Published var zipCode: String = UserDefaults.standard.string(forKey: "medicalSchoolZipCode") ?? ""
 @Published var showAlert = false
 @Published var showClearAlert = false

 func saveData() async {
 UserDefaults.standard.set(medicalSchoolName, forKey: "medicalSchoolName")
 UserDefaults.standard.set(shortName, forKey: "medicalSchoolShortName")
 UserDefaults.standard.set(streetAddress1, forKey: "medicalSchoolStreetAddress1")
 UserDefaults.standard.set(streetAddress2, forKey: "medicalSchoolStreetAddress2")
 UserDefaults.standard.set(city, forKey: "medicalSchoolCity")
 UserDefaults.standard.set(state, forKey: "medicalSchoolState")
 UserDefaults.standard.set(zipCode, forKey: "medicalSchoolZipCode")
 showAlert = true
 }

 func clearData() async {
 UserDefaults.standard.removeObject(forKey: "medicalSchoolName")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolShortName")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolStreetAddress1")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolStreetAddress2")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolCity")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolState")
 UserDefaults.standard.removeObject(forKey: "medicalSchoolZipCode")
 medicalSchoolName = ""
 shortName = ""
 streetAddress1 = ""
 streetAddress2 = ""
 city = ""
 state = ""
 zipCode = ""
 showClearAlert = true
 }
 }
 */

//new code below - changed to allow for easier testing and init of userdefaults
import Foundation

@MainActor
class MedicalSchoolDetailsViewModel: ObservableObject {
  @Published var medicalSchoolName: String
  @Published var shortName: String
  @Published var streetAddress1: String
  @Published var streetAddress2: String
  @Published var city: String
  @Published var state: String
  @Published var zipCode: String
  @Published var showAlert = false
  @Published var showClearAlert = false

  private var userDefaults: UserDefaults

  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
    self.medicalSchoolName = userDefaults.string(forKey: "medicalSchoolName") ?? ""
    self.shortName = userDefaults.string(forKey: "medicalSchoolShortName") ?? ""
    self.streetAddress1 = userDefaults.string(forKey: "medicalSchoolStreetAddress1") ?? ""
    self.streetAddress2 = userDefaults.string(forKey: "medicalSchoolStreetAddress2") ?? ""
    self.city = userDefaults.string(forKey: "medicalSchoolCity") ?? ""
    self.state = userDefaults.string(forKey: "medicalSchoolState") ?? ""
    self.zipCode = userDefaults.string(forKey: "medicalSchoolZipCode") ?? ""
  }

  func saveData() async {
    userDefaults.set(medicalSchoolName, forKey: "medicalSchoolName")
    userDefaults.set(shortName, forKey: "medicalSchoolShortName")
    userDefaults.set(streetAddress1, forKey: "medicalSchoolStreetAddress1")
    userDefaults.set(streetAddress2, forKey: "medicalSchoolStreetAddress2")
    userDefaults.set(city, forKey: "medicalSchoolCity")
    userDefaults.set(state, forKey: "medicalSchoolState")
    userDefaults.set(zipCode, forKey: "medicalSchoolZipCode")
    showAlert = true
  }

  func clearData() async {
    userDefaults.removeObject(forKey: "medicalSchoolName")
    userDefaults.removeObject(forKey: "medicalSchoolShortName")
    userDefaults.removeObject(forKey: "medicalSchoolStreetAddress1")
    userDefaults.removeObject(forKey: "medicalSchoolStreetAddress2")
    userDefaults.removeObject(forKey: "medicalSchoolCity")
    userDefaults.removeObject(forKey: "medicalSchoolState")
    userDefaults.removeObject(forKey: "medicalSchoolZipCode")
    medicalSchoolName = ""
    shortName = ""
    streetAddress1 = ""
    streetAddress2 = ""
    city = ""
    state = ""
    zipCode = ""
    showClearAlert = true
  }
}


