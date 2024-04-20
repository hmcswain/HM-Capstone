
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


