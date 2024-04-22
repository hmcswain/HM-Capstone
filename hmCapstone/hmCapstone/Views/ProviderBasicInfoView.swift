import SwiftUI
/*
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

import SwiftUI

struct ProviderBasicInfoView: View {
    var provider: Provider

    var body: some View {
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

            Section(header: Text("Location")) {
                ForEach(provider.addresses, id: \.postalCode) { address in
                    Text("\(address.city), \(address.state) \(address.postalCode)")
                    Text("Country: \(address.countryName)")
                }
            }

            Section(header: Text("Taxonomy/Specialty")) {
                ForEach(provider.taxonomies, id: \.desc) { taxonomy in
                    if let desc = taxonomy.desc {
                        Text("Description: \(desc)")
                    }
                    if let state = taxonomy.state {
                        Text("State: \(state)")
                    }
                    Text("Primary: \(taxonomy.primary == true ? "Yes" : "No")")
                }
            }
        }
        .navigationTitle("Provider Basic Information")
        .navigationBarTitleDisplayMode(.inline)  // Inline title display mode
    }
}

struct ProviderBasicInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProviderBasicInfoView(provider: Provider.mock())
        }
    }
}

