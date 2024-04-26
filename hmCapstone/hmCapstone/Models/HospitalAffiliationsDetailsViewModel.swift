//
//  HospitalAffiliationsDetailsViewModel.swift

/*
import Foundation

@MainActor
class HospitalAffiliationsDetailsViewModel: ObservableObject {
  @Published var hospitalName: String = UserDefaults.standard.string(forKey: "hospitalName") ?? ""
  @Published var streetAddress1: String = UserDefaults.standard.string(forKey: "streetAddress1") ?? ""
  @Published var streetAddress2: String = UserDefaults.standard.string(forKey: "streetAddress2") ?? ""
  @Published var city: String = UserDefaults.standard.string(forKey: "hospitalCity") ?? ""
  @Published var state: String = UserDefaults.standard.string(forKey: "hospitalState") ?? ""
  @Published var zipCode: String = UserDefaults.standard.string(forKey: "hospitalZipCode") ?? ""
  @Published var hospitalType: String = UserDefaults.standard.string(forKey: "hospitalType") ?? ""
  @Published var showAlert = false
  @Published var showClearAlert = false

  func saveData() async {
    UserDefaults.standard.set(hospitalName, forKey: "hospitalName")
    UserDefaults.standard.set(streetAddress1, forKey: "streetAddress1")
    UserDefaults.standard.set(streetAddress2, forKey: "streetAddress2")
    UserDefaults.standard.set(city, forKey: "hospitalCity")
    UserDefaults.standard.set(state, forKey: "hospitalState")
    UserDefaults.standard.set(zipCode, forKey: "hospitalZipCode")
    UserDefaults.standard.set(hospitalType, forKey: "hospitalType")
    showAlert = true
  }

  func clearData() async {
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
*/

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

