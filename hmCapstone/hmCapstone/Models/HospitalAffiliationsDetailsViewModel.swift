//  HospitalAffiliationsDetailsViewModel.swift

import Foundation

@MainActor
class HospitalAffiliationsDetailsViewModel: ObservableObject {
  @Published var hospitalName: String
  @Published var streetAddress1: String
  @Published var streetAddress2: String
  @Published var city: String
  @Published var state: String
  @Published var zipCode: String
  @Published var hospitalType: String
  @Published var showAlert = false
  @Published var showClearAlert = false
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
    self.hospitalName = userDefaults.string(forKey: "hospitalName") ?? ""
    self.streetAddress1 = userDefaults.string(forKey: "streetAddress1") ?? ""
    self.streetAddress2 = userDefaults.string(forKey: "streetAddress2") ?? ""
    self.city = userDefaults.string(forKey: "hospitalCity") ?? ""
    self.state = userDefaults.string(forKey: "hospitalState") ?? ""
    self.zipCode = userDefaults.string(forKey: "hospitalZipCode") ?? ""
    self.hospitalType = userDefaults.string(forKey: "hospitalType") ?? ""
  }
  func saveData() {
    userDefaults.set(hospitalName, forKey: "hospitalName")
    userDefaults.set(streetAddress1, forKey: "streetAddress1")
    userDefaults.set(streetAddress2, forKey: "streetAddress2")
    userDefaults.set(city, forKey: "hospitalCity")
    userDefaults.set(state, forKey: "hospitalState")
    userDefaults.set(zipCode, forKey: "hospitalZipCode")
    userDefaults.set(hospitalType, forKey: "hospitalType")
    showAlert = true
  }
  func clearData() {
    userDefaults.removeObject(forKey: "hospitalName")
    userDefaults.removeObject(forKey: "streetAddress1")
    userDefaults.removeObject(forKey: "streetAddress2")
    userDefaults.removeObject(forKey: "hospitalCity")
    userDefaults.removeObject(forKey: "hospitalState")
    userDefaults.removeObject(forKey: "hospitalZipCode")
    userDefaults.removeObject(forKey: "hospitalType")
    hospitalName = ""
    streetAddress1 = ""
    streetAddress2 = ""
    city = ""
    state = ""
    zipCode = ""
    hospitalType = ""
    showClearAlert = true
  }
}
