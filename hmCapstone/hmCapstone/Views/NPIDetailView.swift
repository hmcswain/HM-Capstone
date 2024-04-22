//
//  NPIDetailView.swift
//  hmCapstone
//
//  Created by Jj on 4/19/24.
//
/*
import SwiftUI

struct NPIDetailView: View {
  @ObservedObject var viewModel: ProviderViewModel
  var npi: String
  
  var body: some View {
    List {
      ForEach(viewModel.providers, id: \.number) { provider in
        NavigationLink(destination: Text("Here is navigation page")) {
          VStack(alignment: .leading) {
            Text("NPI Number: \(provider.number)")
            Text("NPI Type: \(provider.enumerationType)")
            Text("Name of Provider: \(provider.basic.firstName) \(provider.basic.lastName)")
            Text("NPI number: \(provider.number)")
            
            //       Text("Assigned to \(provider.basic.namePrefix)  \(provider.basic.firstName) \(provider.basic.lastName). ")
            Text("Enumeration Date: \(provider.basic.enumerationDate)")
            Text("Sole Proprietor: \(provider.basic.soleProprietor)")
            Text("Last Update: \(provider.basic.lastUpdated ?? "Not updated")")
            Text("NPI Status: \(provider.basic.status ?? "Unknown")")

          }
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
*/
/*
#Preview {
  NPIDetailView(viewModel: <#ProviderViewModel#>, npi: <#String#>)
}

 */

/*
import SwiftUI

struct NPIDetailView: View {
    @ObservedObject var viewModel: ProviderViewModel
    var npi: String

    var body: some View {
        VStack {
            Text("NPI Details") // Header Title as a simple Text
                .font(.largeTitle)
                .padding()

            List {
                ForEach(viewModel.providers, id: \.number) { provider in
                    VStack(alignment: .leading) {
                        Text("NPI Number: \(provider.number)")
                        Text("NPI Type: \(provider.enumerationType)")
                        Text("Name of Provider: \(provider.basic.firstName) \(provider.basic.lastName)")
                        Text("Enumeration Date: \(provider.basic.enumerationDate)")
                        Text("Sole Proprietor: \(provider.basic.soleProprietor)")
     //                   Text("Last Update: \(provider.basic.lastUpdated)")
   //                     Text("NPI Status: \(provider.basic.status)")
                    }
                    .padding()
                }
            }
            .listStyle(PlainListStyle()) // Optional: Changes the style of the list
        }
  //      .navigationBarTitle("NPI Details", displayMode: .inline) // If inside a navigation view
    }
}

struct NPIDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NPIDetailView(viewModel: ProviderViewModel.mock(), npi: "1063456715")
        }
    }
}

*/

import SwiftUI

struct NPIDetailView: View {
    @ObservedObject var viewModel: ProviderViewModel
    var npi: String

  var body: some View {
    NavigationView {
      VStack {
        Text("NPI Details")
          .font(.largeTitle)
          .padding()
        
        List {
          ForEach(viewModel.providers, id: \.number) { provider in
            Section(header: Text("NPI Number")) {
              Text(provider.number)
            }
            Section(header: Text("NPI Type")) {
              Text(provider.enumerationType)
            }
            Section(header: Text("Name of Provider")) {
              Text("\(provider.basic.firstName) \(provider.basic.lastName)")
            }
            Section(header: Text("Enumeration Date")) {
              Text(provider.basic.enumerationDate)
            }
            Section(header: Text("Sole Proprietor")) {
              Text(provider.basic.soleProprietor)
            }
            Section(header: Text("Last Updated")) {
              Text(provider.basic.lastUpdated ?? "N/A")
            }
            Section(header: Text("NPI Status")) {
              Text(provider.basic.status ?? "N/A")
            }
          }
        }
        .listStyle(GroupedListStyle())
      }
  //    .navigationBarTitle("NPI Details", displayMode: .inline)
    }
  }
}

struct NPIDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NPIDetailView(viewModel: ProviderViewModel.mock(), npi: "1063456715")
        }
    }

}
