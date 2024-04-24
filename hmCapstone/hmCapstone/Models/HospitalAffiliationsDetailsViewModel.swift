//
//  HospitalAffiliationsDetailsViewModel.swift
//  hmCapstone
//
import Foundation

class HospitalAffiliationsDetailsViewModel: ObservableObject {
  @Published var hospitalName: String = UserDefaults.standard.string(forKey: "hospitalName") ?? ""
  @Published var streetAddress1: String = UserDefaults.standard.string(forKey: "streetAddress1") ?? ""
  @Published var streetAddress2: String = UserDefaults.standard.string(forKey: "streetAddress2") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "hospitalCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "hospitalState") ?? ""
  @Published var zipCode: String = UserDefaults.standard.string(forKey: "hospitalZipCode") ?? ""
  @Published var hospitalType: String = UserDefaults.standard.string(forKey: "hospitalType") ?? ""
  @Published var showAlert: Bool = false
  @Published var showClearAlert: Bool = false

  func saveData() {
    UserDefaults.standard.set(hospitalName, forKey: "hospitalName")
    UserDefaults.standard.set(streetAddress1, forKey: "streetAddress1")
    UserDefaults.standard.set(streetAddress2, forKey: "streetAddress2")
    UserDefaults.standard.set(city, forKey: "hospitalCity")
    UserDefaults.standard.set(state, forKey: "hospitalState")
    UserDefaults.standard.set(zipCode, forKey: "hospitalZipCode")
    UserDefaults.standard.set(hospitalType, forKey: "hospitalType")
    showAlert = true
  }

  func clearData() {
    UserDefaults.standard.removeObject(forKey: "hospitalName")
    UserDefaults.standard.removeObject(forKey: "streetAddress1")
    UserDefaults.standard.removeObject(forKey: "streetAddress2")
    UserDefaults.standard.removeObject(forKey: "hospitalCity")
    UserDefaults.standard.removeObject(forKey: "hospitalState")
    UserDefaults.standard.removeObject(forKey: "hospitalZipCode")
    UserDefaults.standard.removeObject(forKey: "hospitalType")
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
