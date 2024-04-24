//
//  StateMedicalLicenseDetailsViewModel.swift
//  hmCapstone
//

import Foundation

class StateMedicalLicenseDetailsViewModel: ObservableObject {
    @Published var medicalBoardName: String = UserDefaults.standard.string(forKey: "medicalBoardName") ?? ""
    @Published var issuingState: String = UserDefaults.standard.string(forKey: "issuingState") ?? ""
    @Published var licenseNumber: String = UserDefaults.standard.string(forKey: "licenseNumber") ?? ""
    @Published var licenseExpirationDate: Date = UserDefaults.standard.object(forKey: "licenseExpirationDate") as? Date ?? Date()
    @Published var showAlert: Bool = false
    @Published var showClearAlert: Bool = false

    var daysUntilExpiration: Int {
          Calendar.current.dateComponents([.day], from: Date(), to: licenseExpirationDate).day ?? 0
      }
/*
    var daysUntilExpiration: Int {
          guard let expirationDate = UserDefaults.standard.object(forKey: "licenseExpirationDate") as? Date else {
              return 0
          }
          return Calendar.current.dateComponents([.day], from: Date(), to: expirationDate).day ?? 0
      }
*/
    func saveData() {
        UserDefaults.standard.set(medicalBoardName, forKey: "medicalBoardName")
        UserDefaults.standard.set(issuingState, forKey: "issuingState")
        UserDefaults.standard.set(licenseNumber, forKey: "licenseNumber")
        UserDefaults.standard.set(licenseExpirationDate, forKey: "licenseExpirationDate")
        showAlert = true
    }

    func clearData() {
        UserDefaults.standard.removeObject(forKey: "medicalBoardName")
        UserDefaults.standard.removeObject(forKey: "issuingState")
        UserDefaults.standard.removeObject(forKey: "licenseNumber")
        UserDefaults.standard.removeObject(forKey: "licenseExpirationDate")
        medicalBoardName = ""
        issuingState = ""
        licenseNumber = ""
        licenseExpirationDate = Date()
        showClearAlert = true
    }
}

