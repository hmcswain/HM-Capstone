import SwiftUI

struct MedicalSchoolDetailView: View {
  //   var school: MedicalSchool
  /*
   var body: some View {
   List {
   Section(header: Text("Name of Medical School")) {
   Text(school.name)
   }
   // Additional sections for more details about the medical school
   }
   .navigationTitle("Medical School Details")
   }
   }
   */

  //  struct MedicalSchoolsView: View {
  @StateObject private var viewModel = MedicalSchoolsViewModel()
  @State private var searchText = ""
  @State private var selectedSchool: MedicalSchool?

  var body: some View {
    VStack {
      TextField("Start typing...", text: $searchText, onCommit: {
        // Commit action, such as search or dismiss keyboard
      })
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
      .autocapitalization(.none)
      .disableAutocorrection(true)

      List {
        // Filtered list based on searchText
        ForEach(viewModel.medicalSchools.filter {
          self.searchText.isEmpty ? true : $0.medicalSchoolName.localizedCaseInsensitiveContains(self.searchText)
        }) { school in
          Text(school.medicalSchoolName).onTapGesture {
            self.selectedSchool = school
            // Call a function to save the selected school details to UserDefaults
            saveSelectedSchool(school)
          }
        }
      }
    }
    .onAppear {
      viewModel.loadMedicalSchools()
    }
  }

  func saveSelectedSchool(_ school: MedicalSchool) {
    if let encoded = try? JSONEncoder().encode(school) {
      UserDefaults.standard.set(encoded, forKey: "selectedMedicalSchool")
    }
  }

  func loadSelectedSchool() -> MedicalSchool? {
    guard let savedSchool = UserDefaults.standard.object(forKey: "selectedMedicalSchool") as? Data,
          let loadedSchool = try? JSONDecoder().decode(MedicalSchool.self, from: savedSchool) else {
      return nil
    }
    return loadedSchool
  }
}


/*
struct MedicalSchoolDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MedicalSchoolDetailView(school: MedicalSchool(id: "1", name: "Harvard Medical School"))
  }
}

*/



/*
import SwiftUI

struct MedicalSchoolDetailView: View {
  let school: MedicalSchool

  var body: some View {
    VStack {
      Text(school.medicalSchoolName)
      // Display other details about the school here.
    }
  }
}
*/
struct MedicalSchoolDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MedicalSchoolDetailView(school: MedicalSchool(
      id: "1",
      medicalSchoolName: "Harvard Medical School",
      shortName: "Harvard",
      medicalSchoolCity: "Boston",
      medicalSchoolState: "Massachusetts",
      medicalSchoolRegion: "Northeast",
      ownershipControl: "Private"
    ))
  }
}




