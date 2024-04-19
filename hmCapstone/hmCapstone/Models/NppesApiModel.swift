
import Foundation


struct ApiResponse: Codable {
  let resultCount: Int
  let results: [Provider]

  enum CodingKeys: String, CodingKey {
    case resultCount = "result_count"
    case results
  }
}

struct Provider: Codable {
//  var id = UUID()
//  let enumerationType: String
  let number: String
  let basic: Basic
  let addresses: [Address]
  let taxonomies: [Taxonomy]
}

struct Basic: Codable {
  let firstName: String
  let lastName: String
  let credential: String?
//  let soleProprietor: String
//  let gender: String?
//  let enumerationDate: String
  //let lastUpdated: String
  //let status: String?
  //let namePrefix: String?
  //let nameSuffix: String?

  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case credential /*
    case soleProprietor = "sole_proprietor"
    case gender
    case enumerationDate = "enumeration_date"
    case lastUpdated = "last_updated"
    case status
    case namePrefix = "name_prefix"
    case nameSuffix = "name_suffix" */
  }
}

struct Address: Codable {
  let countryName: String
  let city: String
  let state: String
  let postalCode: String

  enum CodingKeys: String, CodingKey {
    case countryName = "country_name"
    case city, state, postalCode = "postal_code"
  }
}

struct Taxonomy: Codable {
  let desc: String
  let state: String
  let primary: Bool

  enum CodingKeys: String, CodingKey {
    case desc, state, primary
  }
}

