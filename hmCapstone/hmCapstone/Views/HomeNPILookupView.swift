//  hmCapstone

import SwiftUI

struct HomeNPILookupView: View {
  @State private var npiNumber = ""
  @State private var shouldNavigate = false
  @StateObject private var viewModel = ProviderViewModel()
  var body: some View {
    NavigationStack {
      VStack {
        TextField("Enter NPI Number", text: $npiNumber)
          .textFieldStyle(.roundedBorder)
          .padding()
          .accessibilityIdentifier("Enter NPI Number")

        Button("Fetch Provider Details") {
          Task {
            await viewModel.fetchProviderDetails(npi: npiNumber)
            if viewModel.errorMessage == nil {
              shouldNavigate = true
            }
          }
        }
        .buttonStyle(.borderedProminent)
        .disabled(npiNumber.isEmpty)
        .padding()
        .accessibilityIdentifier("Fetch Provider Details")
        Text(
          "\nPlease enter your 10-digit NPI number.\n" +
          "If you don't know it, you can find it by searching your name at\n" +
          "\nhttps://npiregistry.cms.hhs.gov/search\n" +
          "\nPlease copy and paste the URL into your browser."
        )
          .multilineTextAlignment(.center)
        Spacer()
          .navigationDestination(isPresented: $shouldNavigate) {
            MainTabView(npi: npiNumber)
            Text("")
              .hidden()
          }
      }
      .navigationTitle("NPI Lookup")
      .alert(isPresented: Binding<Bool>(
        get: { viewModel.errorMessage != nil },
        set: { _ in viewModel.errorMessage = nil }
      )) {
        Alert(
          title: Text("Error"),
          message: Text(viewModel.errorMessage ?? "An unexpected error occurred"),
          dismissButton: .default(Text("OK")
          )
        )
      }
    }
  }
}

#Preview {
  HomeNPILookupView()
}
