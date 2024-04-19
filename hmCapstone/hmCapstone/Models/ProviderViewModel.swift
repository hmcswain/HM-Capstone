//
//  ProviderViewModel.swift
//  hmCapstone


//
//  ProviderViewModel.swift
//  TabViews-API-April15-2024-1715hours
//
//  Created by Jj on 4/15/24.
//
//import Combine
//import SwiftUI
//import Foundation

/*
 
 class ProviderViewModel: ObservableObject {
 @Published var providers: [Provider] = []
 @Published var isLoading = false
 @Published var errorMessage: String? {
 didSet {
 if errorMessage != nil {
 showAlert = true
 }
 }
 }
 @Published var showAlert = false
 
 func fetchProviderDetails(npi: String) async {
 isLoading = true
 defer { isLoading = false }
 let urlString = "https://npiregistry.cms.hhs.gov/api/?version=2.1&number=\(npi)"
 guard let url = URL(string: urlString) else {
 errorMessage = "Invalid URL"
 return
 }
 
 do {
 let (data, _) = try await URLSession.shared.data(from: url)
 let decoder = JSONDecoder()
 let response = try decoder.decode(ApiResponse.self, from: data)
 DispatchQueue.main.async {
 self.providers = response.results
 }
 } catch {
 DispatchQueue.main.async {
 self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
 }
 }
 }
 }
 
 */

import SwiftUI
import Combine

@MainActor
class ProviderViewModel: ObservableObject {
  @Published var providers: [Provider] = []
  @Published var hospitals: [Hospital] = []
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  func fetchProviderDetails(npi: String) async {
    isLoading = true
    defer { isLoading = false } // This ensures isLoading is reset when the function completes
    let urlString = "https://npiregistry.cms.hhs.gov/api/?version=2.1&number=\(npi)"
    guard let url = URL(string: urlString) else {
      errorMessage = "Invalid URL"
      return
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      let response = try decoder.decode(ApiResponse.self, from: data)
      providers = response.results
    } catch {
      errorMessage = "Failed to fetch data: \(error.localizedDescription)"
    }
  }
  
  func clearErrorMessage() {
    errorMessage = nil
  }
  func addHospital(hospital: Hospital) {hospitals.append(hospital)
  }
}

extension ProviderViewModel {
  static func mock() -> ProviderViewModel {
    let model = ProviderViewModel()
    // Create mock providers data
    model.providers = [
      Provider(
        number: "1063456715",
        basic: Basic(
          firstName: "John",
          lastName: "Doe",
          credential: "MD"
        ),
        addresses: [
          Address(
            countryName: "United States",
            city: "San Francisco",
            state: "CA",
            postalCode: "94102"
          ),
          Address(
            countryName: "United States",
            city: "San Francisco",
            state: "CA",
            postalCode: "94103"
          )
        ],
        taxonomies: [
          Taxonomy(
            desc: "General Practice",
            state: "CA",
            primary: true
          )
        ]
      )
    ]
    return model
  }
}


/*
 
 import SwiftUI
 import Combine
 
 
 @MainActor
 class ProviderViewModel: ObservableObject {
 @Published var providers: [Provider] = []
 @Published var hospitals: [Hospital] = []
 @Published var isLoading = false
 @Published var errorMessage: String?
 
 func fetchProviderDetails(npi: String) async {
 isLoading = true
 defer { isLoading = false } // This ensures isLoading is reset when the function completes
 let urlString = "https://npiregistry.cms.hhs.gov/api/?version=2.1&number=\(npi)"
 guard let url = URL(string: urlString) else {
 errorMessage = "Invalid URL"
 return
 }
 do {
 let (data, _) = try await URLSession.shared.data(from: url)
 let decoder = JSONDecoder()
 decoder.dateDecodingStrategy = .millisecondsSince1970
 let response = try decoder.decode(ApiResponse.self, from: data)
 providers = response.results
 } catch {
 errorMessage = "Failed to fetch data: \(error.localizedDescription)"
 }
 }
 func clearErrorMessage() {
 errorMessage = nil
 }
 /*      do {
  let (data, _) = try await URLSession.shared.data(from: url)
  let decoder = JSONDecoder()
  let response = try decoder.decode(ApiResponse.self, from: data)
  providers = response.results
  } catch {
  errorMessage = "Failed to fetch data: \(error.localizedDescription)"
  }
  }
  
  func clearErrorMessage() {
  errorMessage = nil
  }
  
  */
 func addHospital(hospital: Hospital) {hospitals.append(hospital)
 }
 }
 
 extension ProviderViewModel {
 static func mock() -> ProviderViewModel {
 let model = ProviderViewModel()
 // Create mock providers data
 model.providers = [
 Provider(
 enumerationType: "NPI-1",
 number: "1063456715",
 basic: Basic(
 firstName: "John",
 lastName: "Doe",
 credential: "MD" /*,
                   soleProprietor: "NO",
                   gender: "Male",
                   enumerationDate: "2006-06-15",
                   lastUpdated: "2023-03-07",
                   status: "Active",
                   namePrefix: "Dr.",
                   nameSuffix: "--" */
 ),
 addresses: [
 Address(
 countryName: "United States",
 city: "San Francisco",
 state: "CA",
 postalCode: "94102"
 ),
 Address(
 countryName: "United States",
 city: "San Francisco",
 state: "CA",
 postalCode: "94103"
 )
 ],
 taxonomies: [
 Taxonomy(
 desc: "General Practice",
 state: "CA",
 primary: true
 )
 ]
 )
 ]
 return model
 }
 }
 
 */
