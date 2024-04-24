

/*
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

 */

/*
 import SwiftUI

 struct MainTabView: View {
 var npi: String
 @StateObject var providerViewModel = ProviderViewModel()
 @StateObject var medicalSchoolViewModel = MedicalSchoolsViewModel()  // Add this line

 var body: some View {
 TabView {
 PublicDataView(providerViewModel: providerViewModel, medicalSchoolViewModel: medicalSchoolViewModel)  // Updated constructor
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
 await providerViewModel.fetchProviderDetails(npi: npi)
 }
 }
 }
 }

 // Update the preview as well
 struct MainTabView_Previews: PreviewProvider {
 static var previews: some View {
 MainTabView(npi: "1063456713")
 }
 }

 */

import SwiftUI
/*
struct MainTabView: View {
  var npi: String
  @StateObject var providerViewModel = ProviderViewModel()
  @StateObject var medicalSchoolViewModel = MedicalSchoolsViewModel()

  var body: some View {
    TabView {
      PublicDataView(providerViewModel: providerViewModel, medicalSchoolViewModel: medicalSchoolViewModel)
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
        await providerViewModel.fetchProviderDetails(npi: npi)
      }
    }
  }
}

// Update preview to pass an NPI
struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    MainTabView(npi: "1063456713")
  }
}

*/

import SwiftUI

struct MainTabView: View {
    var npi: String
    @StateObject var providerViewModel = ProviderViewModel()
    @StateObject var medicalSchoolViewModel = MedicalSchoolsViewModel()

    var body: some View {
        TabView {
            NavigationStack {
                PublicDataView(providerViewModel: providerViewModel, medicalSchoolViewModel: medicalSchoolViewModel)
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

