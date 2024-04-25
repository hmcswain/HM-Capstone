//
//  ResidencyDetailView.swift
//  hmCapstone
//


import SwiftUI

struct ResidencyDetailView: View {
  @StateObject private var viewModel = ResidencyDetailsViewModel()

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Residency Program Name")) {
          TextField("Enter residency program name", text: $viewModel.residencyProgramName)
        }
        Section(header: Text("Program Director Name")) {
          TextField("Enter program director name", text: $viewModel.programDirectorName)
        }
        Section(header: Text("ACGME Institution Name")) {
          TextField("Enter ACGME institution name", text: $viewModel.acgmeInstitutionName)
        }
        Section(header: Text("City")) {
          TextField("Enter city", text: $viewModel.city)
        }
        Section(header: Text("State")) {
          TextField("Enter state", text: $viewModel.state)
        }
        Section {
          Button("Save Details") {
            Task {
              await viewModel.saveData()
            }
          }
          .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.borderedProminent)

          Button("Clear Details") {
            Task {
              await viewModel.clearData()
            }
          }
          .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Residency Details")
    }
  }
}

struct ResidencyDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ResidencyDetailView()
  }
}

