//
//  MedicalSchoolDetailsViewModel.swift
//  hmCapstone
//

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
    @Published var showAlert: Bool = false
    @Published var showClearAlert: Bool = false

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

