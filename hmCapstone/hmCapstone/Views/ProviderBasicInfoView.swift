
/*

 import SwiftUI

 struct ProviderBasicInfoView: View {
 var provider: Provider

 var body: some View {
 NavigationView {
 List {
 Section(header: Text("Name")) {
 Text("First Name: \(provider.basic.firstName)")
 Text("Last Name: \(provider.basic.lastName)")
 }

 if let credential = provider.basic.credential {
 Section(header: Text("Degree")) {
 Text(credential)
 }
 }

 if let gender = provider.basic.gender {
 Section(header: Text("Legal Gender")) {
 Text(gender)
 }
 }

 if !provider.addresses.isEmpty {
 ForEach(provider.addresses.indices, id: \.self) { index in
 let address = provider.addresses[index]
 Section(header: Text("Location \(index + 1)")) {
 Text("\(address.city), \(address.state) \(address.postalCode)")
 Text("Country: \(address.countryName)")
 }
 }
 }

 if !provider.taxonomies.isEmpty {
 ForEach(provider.taxonomies.indices, id: \.self) { index in
 let taxonomy = provider.taxonomies[index]
 Section(header: Text("Taxonomy/Specialty \(index + 1)")) {
 if let desc = taxonomy.desc {
 Text("Description: \(desc)")
 }
 if let state = taxonomy.state {
 Text("State: \(state)")
 }
 Text("Primary: \(taxonomy.primary ?? false ? "Yes" : "No")")
 }
 }
 }
 }
 .navigationTitle("Provider Basic Information")
 .navigationBarTitleDisplayMode(.inline)  // Inline title display mode
 }
 }
 }

 struct ProviderBasicInfoView_Previews: PreviewProvider {
 static var previews: some View {
 NavigationView {
 ProviderBasicInfoView(provider: Provider.mock())
 }
 }
 }

 */
