
//  PublicDataView.swift
//  hmCapstone


import SwiftUI
/*
 struct PublicDataView: View {
 @ObservedObject var viewModel: ProviderViewModel
 var npi: String

 var body: some View {
 List(viewModel.providers, id: \.number) { provider in
 VStack(alignment: .leading, spacing: 10) {
 Text("NPI Number: \(provider.number)")
 .fontWeight(.bold)
 Text("Name: \(provider.basic.firstName) \(provider.basic.lastName)")
 Text("Credential: \(provider.basic.credential ?? "N/A")")

 ForEach(provider.addresses, id: \.postalCode) { address in
 VStack(alignment: .leading) {
 Text("Address:")
 Text("\(address.countryName)")
 Text("\(address.city), \(address.state) \(address.postalCode)")
 }
 }
 Divider()

 }
 Section(header: Text("Hospitals")) {
 ForEach(viewModel.hospitals, id: \.id) { hospital in
 Text(hospital.name)
 }
 NavigationLink(destination: AddHospitalView(hospitals: $viewModel.hospitals)) {
 Text("Add Hospital")
 }
 }
 }
 .onAppear {
 Task {
 await viewModel.fetchProviderDetails(npi: npi)
 }
 }
 }
 }

 */


/*
 import SwiftUI

 struct PublicDataView: View {
 @ObservedObject var viewModel: ProviderViewModel
 var npi: String


 var body: some View {
 NavigationView {
 List {
 ForEach(viewModel.providers, id: \.number) { provider in
 NavigationLink(destination: Text("Here is navigation page")) {
 VStack(alignment: .leading) {
 Text("NPI: \(provider.number)")
 Text("NPI Type: \(provider.enumerationType)")
 Text("Name: \(provider.basic.firstName) \(provider.basic.lastName)")
 ForEach(provider.addresses, id: \.postalCode) { address in
 Text("Address: \(address.city), \(address.state)")
 }
 ForEach(provider.taxonomies, id: \.desc) { taxonomy in
 Text("Description: \(taxonomy.desc ?? "No Description")")
 Text("State: \(taxonomy.state ?? "No State")")
 Text("Primary: \(taxonomy.primary ?? false ? "Yes" : "No")")
 }
 }



 //                Text("Taxonomy : \(provider.taxonomies.desc)")
 }
 }

 Section(header: Text("National Provider Identifier Record")) {

 ForEach(viewModel.providers, id: \.number) { provider in
 NavigationLink(destination: NPIDetailView(viewModel: viewModel, npi: provider.number)) {
 Text("NPI: \(provider.number)")
 }
 }
 }

 Section(header: Text("Hospitals")) {
 ForEach(viewModel.hospitals, id: \.id) { hospital in
 Text(hospital.name)
 }
 NavigationLink(destination: AddHospitalView(hospitals: $viewModel.hospitals, viewModel: HospitalViewModel())) {
 Text("Add Hospital")
 }
 }
 /*       Section(header: Text "Medical School")) {

  } */
 }
 .navigationTitle("Public Data")
 }
 }
 }

 struct PublicDataView_Previews: PreviewProvider {
 static var previews: some View {
 PublicDataView(viewModel: ProviderViewModel.mock(), npi: "1234567890")
 .previewDisplayName("Public Data View Preview")
 }
 }

 */
/*
 import SwiftUI

 struct ProviderBasicInfoView: View {
 var provider: Provider

 var body: some View {
 List {
 Section(header: Text("Name")) {
 Text("First Name: \(provider.basic.firstName)")
 Text("Last Name: \(provider.basic.lastName)")
 }
 // Add more sections for other basic information if needed
 }
 .navigationTitle("Provider Basic Information")
 }
 }

 struct ProviderBasicInfoView_Previews: PreviewProvider {
 static var previews: some View {
 ProviderBasicInfoView(provider: Provider.mock())
 }
 }
 */
/*
 import SwiftUI

 struct PublicDataView: View {
 @ObservedObject var viewModel: ProviderViewModel
 @ObservedObject var medicalSchoolViewModel: MedicalSchoolsViewModel
 var body: some View {
 NavigationStack {
 List {
 Section(header: Text("National Provider Identifier Record")) {
 ForEach(viewModel.providers, id: \.number) { provider in
 Text("NPI: \(provider.number)")
 Text("Type: \(provider.enumerationType)")
 }
 }

 Section(header: Text("Provider Basic Information")) {
 ForEach(viewModel.providers, id: \.number) { provider in
 NavigationLink(destination: ProviderBasicInfoView(provider: provider)) {
 Text("View Basic Information")
 }
 }
 }

 Section(header: Text("Medical School")) {
 ForEach(medicalSchooViewlModel.medicalSchools, id: \.id) { school in
 NavigationLink(destination: MedicalSchoolDetailView(school: school)) {
 Text(school.medicalSchoolName)
 }
 }
 }
 }
 .navigationTitle("Public Data")
 }
 }
 }

 struct PublicDataView_Previews: PreviewProvider {
 static var previews: some View {
 PublicDataView(viewModel: ProviderViewModel.mock())
 }
 }

 */
/*
 import SwiftUI

 struct PublicDataView: View {
 @ObservedObject var providerViewModel: ProviderViewModel
 @ObservedObject var medicalSchoolViewModel: MedicalSchoolsViewModel  // Correctly named

 var body: some View {
 NavigationStack {
 List {
 Section(header: Text("National Provider Identifier Record")) {
 ForEach(providerViewModel.providers, id: \.number) { provider in
 NavigationLink(destination: NPIDetailView(viewModel: viewModel, npi: provider.number)) {
 Text("NPI: \(provider.number)")
 }
 Text("NPI: \(provider.number)")
 Text("Type: \(provider.enumerationType)")
 }
 }

 Section(header: Text("Provider Basic Information")) {
 ForEach(providerViewModel.providers, id: \.number) { provider in
 NavigationLink(destination: ProviderBasicInfoView(provider: provider)) {
 Text("View Basic Information")
 }
 }
 }

 Section(header: Text("Medical School")) {
 ForEach(medicalSchoolViewModel.medicalSchools, id: \.id) { school in
 NavigationLink(destination: MedicalSchoolDetailView(school: school)) {
 Text(school.medicalSchoolName)
 }
 }
 }
 }
 .navigationTitle("Public Data")
 }
 }
 }

 // Update preview to pass both view models
 struct PublicDataView_Previews: PreviewProvider {
 static var previews: some View {
 PublicDataView(providerViewModel: ProviderViewModel.mock(), medicalSchoolViewModel: MedicalSchoolsViewModel())
 }
 }

 */

import SwiftUI

struct PublicDataView: View {
  @ObservedObject var providerViewModel: ProviderViewModel
  @ObservedObject var medicalSchoolViewModel: MedicalSchoolsViewModel
  @ObservedObject var medicalSchoolDetailsViewModel = MedicalSchoolDetailsViewModel()
  @ObservedObject var hospitalAffiliationsDetailsViewModel = HospitalAffiliationsDetailsViewModel()
  @ObservedObject var boardCertificationDetailsViewModel = BoardCertificationDetailsViewModel()
  @ObservedObject var fellowshipDetailsViewModel = FellowshipDetailsViewModel()
  @ObservedObject var residencyDetailsViewModel = ResidencyDetailsViewModel()
  @ObservedObject var internshipDetailsViewModel = InternshipDetailsViewModel()

  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("National Provider Identifier Record")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: NPIDetailView(viewModel: providerViewModel, npi: provider.number)) {
              VStack(alignment: .leading, spacing: 4) {
                HStack {
                  Image(systemName: "number")
                    .foregroundColor(.blue) // Set the color to blue
                  Text("NPI Details")
                    .fontWeight(.semibold)
                }

                Text("NPI: \(provider.number)")
                  .font(.subheadline)
              }
              //Label("NPI: \(provider.number)", systemImage: "number")
              //Text("NPI: \(provider.number)")
            }
          }
        }

        //    Text("Type: \(provider.enumerationType)")


        Section(header: Text("Provider Basic Information")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: ProviderBasicInfoView(provider: provider)) {
              VStack(alignment: .leading, spacing: 4) {
                HStack {
                  Image(systemName: "person.text.rectangle")
                    .foregroundColor(.blue) // Set the color to blue
                  Text("Basic Information")
                    .fontWeight(.semibold)
                }

                Text("\(provider.basic.firstName) \(provider.basic.lastName), \(provider.basic.credential ?? "")")
                  .font(.subheadline)
              }
            }
            //           Label("Basic Information", systemImage: "person.text.rectangle")

            //          Text("Basic Information")
          }
        }

        Section(header: Text("Medical School Information")) {
          NavigationLink(destination: MedicalSchoolDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "building.columns")
                  .foregroundColor(.blue) // Keep the color consistent
                Text("Medical School Details")
                  .fontWeight(.semibold)
              }

              // Checking if the medical school name is empty and providing a fallback message
              if medicalSchoolDetailsViewModel.medicalSchoolName.isEmpty {
                Text("No medical school entered. Please enter.")
                  .foregroundColor(.secondary) // You can choose a less prominent color to indicate incomplete data
                  .italic() // Optionally make it italic to emphasize the placeholder nature
              } else {
                Text(medicalSchoolDetailsViewModel.medicalSchoolName)
                  .font(.subheadline)
              }
            }
            //  Label("Medical School Details", systemImage: "building.columns")

          }
        }

        //    Label("Medical School Details", systemImage: "building.columns")
        //  Text("Medical School Details")
        /*
         Section(header: Text("Medical School")) {
         ForEach(medicalSchoolViewModel.medicalSchools, id: \.id) { school in
         NavigationLink(destination: MedicalSchoolSearchView(school: school)) {
         Text(school.medicalSchoolName)
         } */

        Section(header: Text("Internship")) {
          NavigationLink(destination: InternshipDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "briefcase.fill")
                        .foregroundColor(.blue)
                    Text("Internship Details")
                        .fontWeight(.semibold)
                }

                if internshipDetailsViewModel.internshipProgramName.isEmpty {
                    Text("No internship program entered. Please enter.")
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                } else {
                    Text(internshipDetailsViewModel.internshipProgramName)
                    .font(.subheadline)
                }
            }
           // Label("Internship Details", systemImage: "briefcase")
            //                 Text("Internship Details")
          }
        }
        Section(header: Text("Residency")) {
          NavigationLink(destination: ResidencyDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "stethoscope")
                        .foregroundColor(.blue)
                    Text("Residency Details")
                        .fontWeight(.semibold)
                }

                if residencyDetailsViewModel.residencyProgramName.isEmpty {
                    Text("No residency program entered. Please enter.")
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                } else {
                    Text(residencyDetailsViewModel.residencyProgramName)
                        .font(.subheadline)
                }
            }
          //  Label("Residency Details", systemImage: "stethoscope")
            //      Text("Residency Details")
          }
        }
        Section(header: Text("Fellowship")) {
          NavigationLink(destination: FellowshipDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "cross.case")
                        .foregroundColor(.blue)
                    Text("Fellowship Details")
                        .fontWeight(.semibold)
                }

                if fellowshipDetailsViewModel.fellowshipProgramName.isEmpty {
                    Text("No fellowship program entered. Please enter.")
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                } else {
                    Text(fellowshipDetailsViewModel.fellowshipProgramName)
                        .font(.subheadline)
                }
            }
        //    Label("Fellowship Details", systemImage: "cross.case")
            //     Text("Fellowship Details")
          }
        }
        Section(header: Text("Board Certification")) {
          NavigationLink(destination: BoardCertificationDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.blue)
                    Text("Board Certification Details")
                        .fontWeight(.semibold)
                }

                if boardCertificationDetailsViewModel.specialtyName.isEmpty {
                    Text("No board certification details entered. Please enter.")
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                } else {
                    Text(boardCertificationDetailsViewModel.specialtyName)
                        .font(.subheadline)
                }
            }
     //       Label("Board Certification Details", systemImage: "checkmark.seal")
            //           Text("Board Certification Details")
          }
        }

        Section(header: Text("State Medical License")) {
          NavigationLink(destination: StateMedicalLicensesView()) {
            Label("License Details", systemImage: "doc.text")
            //           Text("License Details")
          }
        }

        Section(header: Text("Hospital Affiliation")) {
          NavigationLink(destination: HospitalAffiliationsDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "cross.circle")
                        .foregroundColor(.blue)
                    Text("Hospital Affiliations Details")
                        .fontWeight(.semibold)
                }

                if hospitalAffiliationsDetailsViewModel.hospitalName.isEmpty {
                    Text("No hospital entered. Please enter.")
                        .foregroundColor(.secondary)
                        .italic()
                        .font(.subheadline)
                } else {
                    Text(hospitalAffiliationsDetailsViewModel.hospitalName)
                        .font(.subheadline)
                }
            }
     //       Label("Affiliation Details", systemImage: "cross.circle")
            //     Text("Affiliation Details")
          }
        }

        Section(header: Text("Employers")) {
          NavigationLink(destination: EmployersDetailView()) {
            Label("Employer Details", systemImage: "building")
            //     Text("Employer Details")
          }
        }
      }
      .navigationTitle("Public Data")

    }
  }
}



// Update preview to pass both view models
struct PublicDataView_Previews: PreviewProvider {
  static var previews: some View {
    PublicDataView(providerViewModel: ProviderViewModel.mock(), medicalSchoolViewModel: MedicalSchoolsViewModel())
  }
}

