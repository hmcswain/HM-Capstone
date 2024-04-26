//
//  BoardCertificationDetailsViewModel.swift


//orginal working version below that I showed mani.  I tried to make changes to init to get better situated for testing but not successful.  if all else fails, i can roll back to original versions of boardcertificationdetailsviewmodel and boardcertifcationdetailview
/*
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
 */

//another attempt at trying to init file.  may be okaby but see latest version below
/*
 import Foundation
 
 @MainActor
 class BoardCertificationDetailsViewModel: ObservableObject {
 @Published var certifyingBoardName: String
 @Published var specialtyName: String
 @Published var certificateExpirationDate: Date
 @Published var activeAlert: ActiveAlert? = nil
 
 private var userDefaults: UserDefaults
 
 init(userDefaults: UserDefaults) {
 self.userDefaults = userDefaults
 self.certifyingBoardName = userDefaults.string(forKey: "certifyingBoardName") ?? ""
 self.specialtyName = userDefaults.string(forKey: "specialtyName") ?? ""
 self.certificateExpirationDate = userDefaults.object(forKey: "certificateExpirationDate") as? Date ?? Date()
 }
 
 var daysUntilExpiration: Int {
 Calendar.current.dateComponents([.day], from: Date(), to: certificateExpirationDate).day ?? 0
 }
 
 func saveData() {
 userDefaults.set(certifyingBoardName, forKey: "certifyingBoardName")
 userDefaults.set(specialtyName, forKey: "specialtyName")
 userDefaults.set(certificateExpirationDate, forKey: "certificateExpirationDate")
 activeAlert = .saveAlert
 }
 
 func clearData() {
 userDefaults.removeObject(forKey: "certifyingBoardName")
 userDefaults.removeObject(forKey: "specialtyName")
 userDefaults.removeObject(forKey: "certificateExpirationDate")
 certifyingBoardName = ""
 specialtyName = ""
 certificateExpirationDate = Date()
 activeAlert = .clearAlert
 }
 }
 */

import Foundation

@MainActor
class BoardCertificationDetailsViewModel: ObservableObject {
  @Published var certifyingBoardName: String
  @Published var specialtyName: String
  @Published var certificateExpirationDate: Date
  @Published var activeAlert: ActiveAlert?
  
  private var userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
    self.certifyingBoardName = userDefaults.string(forKey: "certifyingBoardName") ?? ""
    self.specialtyName = userDefaults.string(forKey: "specialtyName") ?? ""
    self.certificateExpirationDate = userDefaults.object(forKey: "certificateExpirationDate") as? Date ?? Date()
  }
  
  var daysUntilExpiration: Int {
    Calendar.current.dateComponents([.day], from: Date(), to: certificateExpirationDate).day ?? 0
  }
  
  func saveData() {
    userDefaults.set(certifyingBoardName, forKey: "certifyingBoardName")
    userDefaults.set(specialtyName, forKey: "specialtyName")
    userDefaults.set(certificateExpirationDate, forKey: "certificateExpirationDate")
    activeAlert = .saveAlert
  }
  
  func clearData() {
    certifyingBoardName = ""
    specialtyName = ""
    certificateExpirationDate = Date()
    userDefaults.removeObject(forKey: "certifyingBoardName")
    userDefaults.removeObject(forKey: "specialtyName")
    userDefaults.removeObject(forKey: "certificateExpirationDate")
    activeAlert = .clearAlert
  }
}

