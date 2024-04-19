
//  HospitalModel.swift
//  hmCapstone



import Foundation

struct Hospital: Identifiable, Codable {
    let id: String
    let name: String
    let address: String
    let city: String
    let state: String
    let zipCode: String
    let county: String
    let hospitalType: String
    let ownership: String

    enum CodingKeys: String, CodingKey {
        case id = "Facility ID"
        case name = "Facility Name"
        case address = "Address"
        case city = "City"
        case state = "State"
        case zipCode = "ZIP Code"
        case county = "County Name"
        case hospitalType = "Hospital Type"
        case ownership = "Hospital Ownership"
    }
}


