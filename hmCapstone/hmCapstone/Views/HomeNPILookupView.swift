//  hmCapstone
//  HomeNPILookupView.swift


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
        Text("\nPlease enter your 10-digit NPI number.\nIf you don't know it, you can find it\nby searching your name at\n\n https://npiregistry.cms.hhs.gov/search\n\nPlease copy and paste the URL\ninto your browser.")
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
        Alert(title: Text("Error"),
          message: Text(viewModel.errorMessage ?? "An unexpected error occurred"),
          dismissButton: .default(Text("OK")))
      }
    }
  }
}

#Preview {
  HomeNPILookupView()
}
