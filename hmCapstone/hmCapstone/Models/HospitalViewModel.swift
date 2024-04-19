
//  HospitalViewModel.swift
//  hmCapstone


import Foundation
import SwiftUI

import Combine

class HospitalViewModel: ObservableObject {
  @Published var hospitals: [Hospital] = []
  @Published var searchText = ""


  func addHospital(name: String, address: String, city: String, state: String, zipCode: String, county: String, hospitalType: String, ownership: String) {
          let newHospital = Hospital(
              id: UUID().uuidString,
              name: name,
              address: address,
              city: city,
              state: state,
              zipCode: zipCode,
              county: county,
              hospitalType: hospitalType,
              ownership: ownership
          )
          hospitals.append(newHospital)
      }

    var filteredHospitals: [Hospital] {
        if searchText.isEmpty {
            return hospitals
        } else {
            return hospitals.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }


}



