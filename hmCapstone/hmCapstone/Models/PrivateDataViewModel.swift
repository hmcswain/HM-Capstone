//
//  PrivateDataViewModel.swift
//  hmCapstone
//


import Foundation

@MainActor
class PrivateDataViewModel: ObservableObject {
  @Published var dateOfBirth: Date {
    didSet {
      UserDefaults.standard.set(dateOfBirth, forKey: "dateOfBirth")
    }
  }
  @Published var countryOfCitizenship = UserDefaults.standard.string(forKey: "countryOfCitizenship") ?? ""
  @Published var streetAddress1 = UserDefaults.standard.string(forKey: "streetAddress1") ?? ""
  @Published var streetAddress2 = UserDefaults.standard.string(forKey: "streetAddress2") ?? ""
  @Published var city = UserDefaults.standard.string(forKey: "city") ?? ""
  @Published var state = UserDefaults.standard.string(forKey: "state") ?? ""
  @Published var zipCode = UserDefaults.standard.string(forKey: "zipCode") ?? ""
  @Published var socialSecurityNumber = UserDefaults.standard.string(forKey: "socialSecurityNumber") ?? ""
  @Published var isSSNVisible = false
  @Published var personalEmail = UserDefaults.standard.string(forKey: "personalEmail") ?? ""
  @Published var personalPhone = UserDefaults.standard.string(forKey: "personalPhone") ?? ""
  @Published var emailError = ""
  @Published var phoneError = ""
  @Published var showSaveAlert: Bool = false
  @Published var showClearAlert: Bool = false

  init() {

    self.dateOfBirth = UserDefaults.standard.object(forKey: "dateOfBirth") as? Date ?? Date()
  }

  func saveData() async {
    UserDefaults.standard.set(countryOfCitizenship, forKey: "countryOfCitizenship")
    UserDefaults.standard.set(streetAddress1, forKey: "streetAddress1")
    UserDefaults.standard.set(streetAddress2, forKey: "streetAddress2")
    UserDefaults.standard.set(city, forKey: "city")
    UserDefaults.standard.set(state, forKey: "state")
    UserDefaults.standard.set(zipCode, forKey: "zipCode")
    UserDefaults.standard.set(socialSecurityNumber, forKey: "socialSecurityNumber")
    UserDefaults.standard.set(personalEmail, forKey: "personalEmail")
    UserDefaults.standard.set(personalPhone, forKey: "personalPhone")
    showSaveAlert = true
  }

  func clearData() async {
    dateOfBirth = Date()
    countryOfCitizenship = ""
    streetAddress1 = ""
    streetAddress2 = ""
    city = ""
    state = ""
    zipCode = ""
    socialSecurityNumber = ""
    personalEmail = ""
    personalPhone = ""
    showClearAlert = true
  }

  func validateEmail() {
    if !personalEmail.isEmpty && !isValidEmail(personalEmail) {
      emailError = "Invalid email format"
    } else {
      emailError = ""
    }
  }

  func validatePhone() {
    if !personalPhone.isEmpty && !isValidPhone(personalPhone) {
      phoneError = "Invalid phone format"
    } else {
      phoneError = ""
    }
  }

  private func isValidEmail(_ email: String) -> Bool {
    let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
    return emailPred.evaluate(with: email)
  }

  private func isValidPhone(_ phone: String) -> Bool {
    let phonePattern = "^[0-9+]{10,13}$"
    let phonePred = NSPredicate(format: "SELF MATCHES %@", phonePattern)
    return phonePred.evaluate(with: phone)
  }
}

