//
//  NPIDetailView.swift
//  hmCapstone
//


import SwiftUI

struct NPIDetailView: View {
  @ObservedObject var viewModel: ProviderViewModel
  var npi: String

  var body: some View {
    Form {
      if let provider = viewModel.providers.first(where: { $0.number == npi }) {
        Section(header: Text("NPI Number")) {
          Text(provider.number)
            .accessibilityIdentifier("NPI Number Label")
        }
        Section(header: Text("NPI Type")) {
          Text(provider.enumerationType)
        }
        Section(header: Text("Provider Full Name")) {
          Text("\(provider.basic.firstName) \(provider.basic.lastName)")
            .accessibilityIdentifier("Provider Full Name Label")
        }
        Section(header: Text("Credential")) {
          Text(provider.basic.credential ?? "None")
        }
        Section(header: Text("Enumeration Date")) {
          Text(provider.basic.enumerationDate)
        }
        Section(header: Text("Last Updated")) {
          Text(provider.basic.lastUpdated ?? "N/A")
        }
        Section(header: Text("Status")) {
          Text(provider.basic.status ?? "Unknown")
        }
        Section(header: Text("Sole Proprietor")) {
          Text(provider.basic.soleProprietor)
        }
      } else {
        Text("No provider found with NPI \(npi)")
      }
    }
    .navigationTitle("NPI Details")
  }
}

struct NPIDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      NPIDetailView(viewModel: ProviderViewModel.mock(), npi: "1063456713")
    }
  }
}
