//
//  NPIDetailView.swift
//  hmCapstone
//
//  Created by Jj on 4/19/24.
//

import SwiftUI

struct NPIDetailView: View {
  @ObservedObject var viewModel: ProviderViewModel
  var npi: String
  
  var body: some View {
    List {
      ForEach(viewModel.providers, id: \.number) { provider in
        NavigationLink(destination: Text("Here is navigation page")) {
          // VStack(alignment: .leading) {
          Text("NPI: \(provider.number)")
          Text("Name: \(provider.basic.firstName) \(provider.basic.lastName)")
          Text("NPI number: \(provider.number)")
          //        Text("Assigned to \(provider.basic.namePrefix)  \(provider.basic.firstName) \(provider.basic.lastName). ")
        }
      }
    }
  }
}

struct NPIDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NPIDetailView(viewModel: ProviderViewModel.mock(), npi: "1063456715")
    }
}

/*
#Preview {
  NPIDetailView(viewModel: <#ProviderViewModel#>, npi: <#String#>)
}

 */
