//
//  BoardCertificationDetailsViewModel.swift
//  hmCapstone
//
//  Created by Jj on 4/23/24.
//
/*
 import Foundation

 class BoardCertificationDetailsViewModel: ObservableObject {
 @Published var specialtyName: String = UserDefaults.standard.string(forKey: "specialtyName") ?? ""
 @Published var certifyingBoardName: String = UserDefaults.standard.string(forKey: "certifyingBoardName") ?? ""
 @Published var certificateExpirationDate: Date = UserDefaults.standard.object(forKey: "certificateExpirationDate") as? Date ?? Date()
 @Published var showAlert: Bool = false
 @Published var showClearAlert: Bool = false

 func saveData() {
 UserDefaults.standard.set(specialtyName, forKey: "specialtyName")
 UserDefaults.standard.set(certifyingBoardName, forKey: "certifyingBoardName")
 UserDefaults.standard.set(certificateExpirationDate, forKey: "certificateExpirationDate")
 showAlert = true
 }

 func clearData() {
 UserDefaults.standard.removeObject(forKey: "specialtyName")
 UserDefaults.standard.removeObject(forKey: "certifyingBoardName")
 UserDefaults.standard.removeObject(forKey: "certificateExpirationDate")
 specialtyName = ""
 certifyingBoardName = ""
 certificateExpirationDate = Date()
 showClearAlert = true
 }
 }

 */


/*

 import Foundation

 class BoardCertificationDetailsViewModel: ObservableObject {
 @Published var specialtyName: String = UserDefaults.standard.string(forKey: "specialtyName") ?? ""
 @Published var certifyingBoardName: String = UserDefaults.standard.string(forKey: "certifyingBoardName") ?? ""
 @Published var certificateExpirationDate: Date = UserDefaults.standard.object(forKey: "certificateExpirationDate") as? Date ?? Date()
 @Published var showAlert: Bool = false
 @Published var showClearAlert: Bool = false

 var daysUntilExpiration: Int {
 Calendar.current.dateComponents([.day], from: Date(), to: certificateExpirationDate).day ?? 0
 }

 func saveData() {
 UserDefaults.standard.set(specialtyName, forKey: "specialtyName")
 UserDefaults.standard.set(certifyingBoardName, forKey: "certifyingBoardName")
 UserDefaults.standard.set(certificateExpirationDate, forKey: "certificateExpirationDate")
 showAlert = true
 }

 func clearData() {
 UserDefaults.standard.removeObject(forKey: "specialtyName")
 UserDefaults.standard.removeObject(forKey: "certifyingBoardName")
 UserDefaults.standard.removeObject(forKey: "certificateExpirationDate")
 specialtyName = ""
 certifyingBoardName = ""
 certificateExpirationDate = Date()
 showClearAlert = true
 }
 }

 */


import Foundation

@MainActor
class BoardCertificationDetailsViewModel: ObservableObject {
  @Published var certifyingBoardName: String = UserDefaults.standard.string(forKey: "certifyingBoardName") ?? ""
  @Published var specialtyName: String = UserDefaults.standard.string(forKey: "specialtyName") ?? ""
  @Published var certificateExpirationDate: Date = UserDefaults.standard.object(forKey: "certificateExpirationDate") as? Date ?? Date()
  @Published var activeAlert: ActiveAlert?

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
    certifyingBoardName = ""
    specialtyName = ""
    certificateExpirationDate = Date()
    activeAlert = .clearAlert
  }
}

