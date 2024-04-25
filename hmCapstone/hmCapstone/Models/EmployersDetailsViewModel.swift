//
//  EmployersDetailsViewModel.swift
//  hmCapstone
//


import Foundation

@MainActor
class EmployersDetailsViewModel: ObservableObject {
  @Published var employerName: String = UserDefaults.standard.string(forKey: "employerName") ?? ""
  @Published var streetAddress1: String = UserDefaults.standard.string(forKey: "employerStreetAddress1") ?? ""
  @Published var streetAddress2: String = UserDefaults.standard.string(forKey: "employerStreetAddress2") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "employerCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "employerState") ?? ""
  @Published var zipCode: String = UserDefaults.standard.string(forKey: "employerZipCode") ?? ""
  @Published var employerType: String = UserDefaults.standard.string(forKey: "employerType") ?? ""
  @Published var showAlert = false
  @Published var showClearAlert = false

  func saveData() async {
    UserDefaults.standard.set(employerName, forKey: "employerName")
    UserDefaults.standard.set(streetAddress1, forKey: "employerStreetAddress1")
    UserDefaults.standard.set(streetAddress2, forKey: "employerStreetAddress2")
    UserDefaults.standard.set(city, forKey: "employerCity")
    UserDefaults.standard.set(state, forKey: "employerState")
    UserDefaults.standard.set(zipCode, forKey: "employerZipCode")
    UserDefaults.standard.set(employerType, forKey: "employerType")
    showAlert = true
  }

  func clearData() async {
    UserDefaults.standard.removeObject(forKey: "employerName")
    UserDefaults.standard.removeObject(forKey: "employerStreetAddress1")
    UserDefaults.standard.removeObject(forKey: "employerStreetAddress2")
    UserDefaults.standard.removeObject(forKey: "employerCity")
    UserDefaults.standard.removeObject(forKey: "employerState")
    UserDefaults.standard.removeObject(forKey: "employerZipCode")
    UserDefaults.standard.removeObject(forKey: "employerType")
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
