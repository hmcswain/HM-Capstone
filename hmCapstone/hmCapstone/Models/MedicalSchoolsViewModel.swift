import Foundation
import Combine

/*
class MedicalSchoolsViewModel: ObservableObject {
  @Published var medicalSchools: [MedicalSchool] = []

  func loadMedicalSchools() async {
    guard let path = Bundle.main.path(forResource: "MedicalSchoolJSON", ofType: "json"),
          let url = URL(string: path) else {
      print("File not found or URL is malformed")
      return
    }

    do {
      // Using URLSession to fetch data asynchronously
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      let jsonData = try decoder.decode(MedicalSchoolsList.self, from: data)
      // Update published property
      self.medicalSchools = jsonData.medicalSchools
    } catch {
      print("Error loading or decoding JSON: \(error)")
    }
  }
}

 */

  /*
   func loadMedicalSchools() {
   if let path = Bundle.main.path(forResource: "MedicalSchoolJSON", ofType: "json") {
   print("File found at path: \(path)")
   guard let data = try? Data(contentsOf: path) else {
   print("Error loading data from path.")
   return
   }
   let decoder = JSONDecoder()
   do {
   let jsonData = try decoder.decode(MedicalSchoolsList.self, from: data)
   self.medicalSchools = jsonData.medicalSchools
   } catch {
   print("Error decoding JSON: \(error)")
   }
   } else {
   print("File not found")
   }
   }
   }
   */



  /*
   class MedicalSchoolsViewModel: ObservableObject {
   @Published var medicalSchools: [MedicalSchool] = []

   init() {
   loadMedicalSchools()
   }

   func loadMedicalSchools() {
   guard let url = Bundle.main.url(forResource: "MedicalSchoolJSON", withExtension: "json"),
   let data = try? Data(contentsOf: url) else {
   print("Medical schools JSON file could not be loaded")
   return
   }

   let decoder = JSONDecoder()
   if let medicalSchoolsList = try? decoder.decode(MedicalSchoolsList.self, from: data) {
   self.medicalSchools = medicalSchoolsList.medicalSchools
   } else {
   print("Decoding of medical schools JSON failed")
   }
   }
   }
   */
  /*
   class MedicalSchoolsViewModel: ObservableObject {
   @Published var medicalSchools: [MedicalSchool] = []

   func loadMedicalSchools() {
   guard let url = Bundle.main.url(forResource: "MedicalSchoolJSON", withExtension: "json"),
   let data = try? Data(contentsOf: url) else {
   print("Failed to load JSON file.")
   return
   }
   let decoder = JSONDecoder()
   if let jsonData = try? decoder.decode(MedicalSchoolsList.self, from: data) {
   self.medicalSchools = jsonData.medicalSchools
   } else {
   print("Failed to decode JSON.")
   }
   }
   }
   */

  /*
   class MedicalSchoolsViewModel: ObservableObject {
   @Published var medicalSchools: [MedicalSchool] = []

   init() {
   loadMedicalSchools()
   }
   func loadMedicalSchools() {
   guard let url = Bundle.main.url(forResource: "MedicalSchoolJSON", withExtension: "json"),
   let data = try? Data(contentsOf: url) else {
   print("Medical schools JSON file could not be loaded")
   return
   }

   let decoder = JSONDecoder()
   if let medicalSchoolsList = try? decoder.decode(MedicalSchoolsList.self, from: data) {
   self.medicalSchools = medicalSchoolsList.medicalSchools
   //        categorizeSchoolsByRegion()
   } else {
   print("Decoding of medical schools JSON failed")
   }
   }

   */
  /*
   func loadMedicalSchools() {
   guard let url = Bundle.main.url(forResource: "MedicalSchools", withExtension: "json"),
   let data = try? Data(contentsOf: url) else {
   print("Medical schools JSON file could not be loaded")
   return
   }

   let decoder = JSONDecoder()
   if let medicalSchoolsList = try? decoder.decode(MedicalSchoolsList.self, from: data) {
   self.medicalSchools = medicalSchoolsList.medicalSchools
   } else {
   print("Decoding of medical schools JSON failed")
   }
   } */


