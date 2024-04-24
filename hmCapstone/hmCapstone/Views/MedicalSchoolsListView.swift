import SwiftUI
/*
 struct MedicalSchoolsListView: View {
 @StateObject private var viewModel = MedicalSchoolsViewModel()
 @State private var searchText = ""

 var body: some View {
 List {
 ForEach(viewModel.medicalSchools.filter {
 searchText.isEmpty || $0.medicalSchoolName.localizedCaseInsensitiveContains(searchText)
 }) { school in
 NavigationLink(destination: MedicalSchoolSearchView(school: school)) {
 Text(school.medicalSchoolName)
 }
 }
 }
 .searchable(text: $searchText)
 .onAppear {
 viewModel.loadMedicalSchools()
 }
 }
 }

 struct MedicalSchoolsListView_Previews: PreviewProvider {
 static var previews: some View {
 MedicalSchoolsListVIew(schools: [
 MedicalSchool(
 id: "1",
 medicalSchoolName: "Harvard Medical School",
 shortName: "Harvard",
 medicalSchoolCity: "Boston",
 medicalSchoolState: "Massachusetts",
 medicalSchoolRegion: "Northeast",
 ownershipControl: "Private"
 )
 ])
 }
 }

 */

import SwiftUI

struct MedicalSchoolsListView: View {
    @StateObject private var viewModel = MedicalSchoolsViewModel()
    @State private var searchText = ""

    var body: some View {
        List {
            ForEach(viewModel.medicalSchools.filter {
                searchText.isEmpty || $0.medicalSchoolName.localizedCaseInsensitiveContains(searchText)
            }) { school in
                NavigationLink(destination: MedicalSchoolInfoView(school: school)) {
                    Text(school.medicalSchoolName)
                }
            }
        }
        .searchable(text: $searchText)
        .onAppear {
          Task {
            await viewModel.loadMedicalSchools()
          }
        }
    }
}

struct MedicalSchoolsListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalSchoolsListView()
    }
}


