//
//  BoardCertificationDetailsViewModel.swift
//  hmCapstone
//


import Foundation

@MainActor
class BoardCertificationDetailsViewModel: ObservableObject {
  @Published var certifyingBoardName: String = UserDefaults.standard.string(forKey: "certifyingBoardName") ?? ""
  @Published var specialtyName: String = UserDefaults.standard.string(forKey: "specialtyName") ?? ""
  @Published var certificateExpirationDate: Date = UserDefaults.standard.object(forKey: "certificateExpirationDate") as? Date ?? Date()
  @Published var activeAlert: ActiveAlert? = nil

  var daysUntilExpiration: Int {
    Calendar.current.dateComponents([.day], from: Date(), to: certificateExpirationDate).day ?? 0
  }

  func saveData() async {
    UserDefaults.standard.set(certifyingBoardName, forKey: "certifyingBoardName")
    UserDefaults.standard.set(specialtyName, forKey: "specialtyName")
    UserDefaults.standard.set(certificateExpirationDate, forKey: "certificateExpirationDate")
    activeAlert = .saveAlert
  }

  func clearData() async {
    UserDefaults.standard.removeObject(forKey: "certifyingBoardName")
    UserDefaults.standard.removeObject(forKey: "specialtyName")
    UserDefaults.standard.removeObject(forKey: "certificateExpirationDate")
    certifyingBoardName = ""
    specialtyName = ""
    certificateExpirationDate = Date()
    activeAlert = .clearAlert
  }
}

