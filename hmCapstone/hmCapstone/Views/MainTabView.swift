


import SwiftUI

struct MainTabView: View {
  var npi: String
  @StateObject var providerViewModel = ProviderViewModel()
  
  var body: some View {
    TabView {
      NavigationStack {
        PublicDataView(providerViewModel: providerViewModel)
          .navigationTitle("Public Data")
      }
      .tabItem {
        Label("Public Data", systemImage: "person.3.fill")
      }
      
      NavigationStack {
        PrivateDataView()
          .navigationTitle("Private Data")
      }
      .tabItem {
        Label("Private Data", systemImage: "lock.fill")
      }
    }
    .onAppear {
      Task {
        await providerViewModel.fetchProviderDetails(npi: npi)
      }
    }
  }
}

