


import SwiftUI

struct MainTabView: View {
    var npi: String
    @StateObject var viewModel = ProviderViewModel()

    var body: some View {
        TabView {
            PublicDataView(viewModel: viewModel, npi: npi)
                .tabItem {
                    Label("Public Data", systemImage: "person.3.fill")
                }

            PrivateDataView()
                .tabItem {
                    Label("Private Data", systemImage: "lock.fill")
                }
        }
        .onAppear {
            Task {
                await viewModel.fetchProviderDetails(npi: npi)
            }
        }
    }
}



#Preview {
  MainTabView(npi: "1063456713")
}

