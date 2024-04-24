//
//  MedicalSchoolModel.swift
//  hmCapstone
//


import Foundation


struct MedicalSchoolsList: Codable {
    var medicalSchools: [MedicalSchool]

   enum CodingKeys: String, CodingKey {
    case medicalSchools = "Medical Schools"
   }
}


struct MedicalSchool: Codable, Identifiable {
    var id: Int
    var medicalSchoolName: String
    var shortName: String
    var medicalSchoolCity: String
    var medicalSchoolState: String
    var medicalSchoolRegion: String
    var ownershipControl: String

    // Define CodingKeys to map JSON keys to property names
    enum CodingKeys: String, CodingKey {
        case id
        case medicalSchoolName = "Medical School Name"
        case shortName = "Short Name"
        case medicalSchoolCity = "Medical School City"
        case medicalSchoolState = "Medical School State"
        case medicalSchoolRegion = "Medical School Region"
        case ownershipControl = "Ownership/Control"
    }
}


