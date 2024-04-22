//
//  MedicalSchoolModel.swift
//  hmCapstone
//
//  Created by Jj on 4/21/24.
//

import Foundation

struct MedicalSchool: Codable, Identifiable {
    var id: String
    var medicalSchoolName: String
    var shortName: String
    var medicalSchoolCity: String
    var medicalSchoolState: String
    var medicalSchoolRegion: String
    var ownershipControl: String

    // Define CodingKeys to map JSON keys to property names if they are different
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

// Assuming you have a root struct to match your JSON structure
struct MedicalSchoolsList: Codable {
    var medicalSchools: [MedicalSchool]

    enum CodingKeys: String, CodingKey {
        case medicalSchools = "Medical Schools"
    }
}

