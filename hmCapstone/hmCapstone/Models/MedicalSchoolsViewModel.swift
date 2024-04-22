import Foundation
import Combine



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


