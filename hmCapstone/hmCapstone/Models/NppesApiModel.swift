// NppesApiModel.swift

import Foundation


struct ApiResponse: Codable {
  var resultCount: Int
  var results: [Provider]

  enum CodingKeys: String, CodingKey {
    case resultCount = "result_count"
    case results
  }
}

struct Provider: Codable {
  var enumerationType: String
  var number: String
  var basic: Basic
  var addresses: [Address]
  var taxonomies: [Taxonomy]


  enum CodingKeys: String, CodingKey {
    case enumerationType = "enumeration_type"
    case number
    case basic
    case addresses
    case taxonomies
  }
  static func mock() -> Provider {
    return Provider(
      enumerationType: "Type 1",
      number: "123456789",
      basic: Basic(
        firstName: "John",
        lastName: "Doe",
        credential: "MD",
        soleProprietor: "No",
        gender: "Male",
        enumerationDate: "2006-06-15",
        lastUpdated: "2023-03-07",
        status: "Active"
      ),
      addresses: [
        Address(
          countryName: "USA",
          city: "New York",
          state: "NY",
          postalCode: "10001"
        )
      ],
      taxonomies: [
        Taxonomy(
          desc: "General Medicine",
          state: "NY",
          primary: true
        )
      ]
    )
  }
}

struct Basic: Codable {
  let firstName: String
  var lastName: String
  var credential: String?
  var soleProprietor: String
  var gender: String?
  var enumerationDate: String
  var lastUpdated: String?
  var status: String?


  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case credential
    case soleProprietor = "sole_proprietor"
    case gender
    case enumerationDate = "enumeration_date"
    case lastUpdated = "last_updated"
    case status
  }
}

struct Address: Codable {
  var countryName: String
  var city: String
  var state: String
  var postalCode: String

  enum CodingKeys: String, CodingKey {
    case countryName = "country_name"
    case city, state, postalCode = "postal_code"
  }
}

struct Taxonomy: Codable {
  var desc: String?
  var state: String?
  var primary: Bool?

  enum CodingKeys: String, CodingKey {
    case desc, state, primary
  }
}



