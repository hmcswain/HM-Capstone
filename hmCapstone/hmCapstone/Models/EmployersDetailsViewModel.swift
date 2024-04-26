//
//  EmployersDetailsViewModel.swift
//  hmCapstone
//

/*
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
 */

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

