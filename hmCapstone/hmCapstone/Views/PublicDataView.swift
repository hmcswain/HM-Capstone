
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
  
  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("National Provider Identifier Record")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: NPIDetailView(viewModel: providerViewModel, npi: provider.number)) {
              Text("NPI: \(provider.number)")
            }
          }
        }
        
        //    Text("Type: \(provider.enumerationType)")
        
        
        Section(header: Text("Provider Basic Information")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: ProviderBasicInfoView(provider: provider)) {
              Text("View Basic Information")
            }
          }
        }
        Section(header: Text("Medical School Information")) {
                            NavigationLink(destination: MedicalSchoolSearchView()) {
                                Text(" View or Search Medical School")
        /*
        Section(header: Text("Medical School")) {
          ForEach(medicalSchoolViewModel.medicalSchools, id: \.id) { school in
            NavigationLink(destination: MedicalSchoolSearchView(school: school)) {
              Text(school.medicalSchoolName)
            } */
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

