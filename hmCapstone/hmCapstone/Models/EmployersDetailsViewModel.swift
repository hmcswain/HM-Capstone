//  EmployersDetailsViewModel.swift

import Foundation
import SwiftUI

@MainActor
class EmployersDetailsViewModel: ObservableObject {
  @Published var employerName: String
  @Published var streetAddress1: String
  @Published var streetAddress2: String
  @Published var city: String
  @Published var state: String
  @Published var zipCode: String
  @Published var employerType: String
  @Published var showAlert = false
  @Published var showClearAlert = false
  private var userDefaults: UserDefaults
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
    employerName = userDefaults.string(forKey: "employerName") ?? ""
    streetAddress1 = userDefaults.string(forKey: "employerStreetAddress1") ?? ""
    streetAddress2 = userDefaults.string(forKey: "employerStreetAddress2") ?? ""
    city = userDefaults.string(forKey: "employerCity") ?? ""
    state = userDefaults.string(forKey: "employerState") ?? ""
    zipCode = userDefaults.string(forKey: "employerZipCode") ?? ""
    employerType = userDefaults.string(forKey: "employerType") ?? ""
  }
  func saveData() {
    userDefaults.set(employerName, forKey: "employerName")
    userDefaults.set(streetAddress1, forKey: "employerStreetAddress1")
    userDefaults.set(streetAddress2, forKey: "employerStreetAddress2")
    userDefaults.set(city, forKey: "employerCity")
    userDefaults.set(state, forKey: "employerState")
    userDefaults.set(zipCode, forKey: "employerZipCode")
    userDefaults.set(employerType, forKey: "employerType")
    showAlert = true
  }
  func clearData() {
    userDefaults.removeObject(forKey: "employerName")
    userDefaults.removeObject(forKey: "employerStreetAddress1")
    userDefaults.removeObject(forKey: "employerStreetAddress2")
    userDefaults.removeObject(forKey: "employerCity")
    userDefaults.removeObject(forKey: "employerState")
    userDefaults.removeObject(forKey: "employerZipCode")
    userDefaults.removeObject(forKey: "employerType")
    employerName = ""
    streetAddress1 = ""
    streetAddress2 = ""
    city = ""
    state = ""
    zipCode = ""
    employerType = ""
    showClearAlert = true
  }
}
