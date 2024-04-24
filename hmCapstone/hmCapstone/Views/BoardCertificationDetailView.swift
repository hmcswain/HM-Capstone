//
//  BoardCertificationDetailView.swift
//  hmCapstone
//
import SwiftUI

struct BoardCertificationDetailView: View {
  @StateObject private var viewModel = BoardCertificationDetailsViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Specialty Name")) {
          TextField("Enter specialty name", text: $viewModel.specialtyName)
        }
        Section(header: Text("Certifying Board Name")) {
          TextField("Enter board name", text: $viewModel.certifyingBoardName)
        }
        Section(header: Text("Certificate Expiration Date")) {
          DatePicker("Choose date of expiration", selection: $viewModel.certificateExpirationDate, displayedComponents: .date)
        }
        Section {
          Button("Save Details") {
            viewModel.saveData()
          }
          .buttonStyle(.borderedProminent)
          Button("Clear Details") {
            viewModel.clearData()
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Board Certification")
      .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) { }
      }
    }
  }
}

struct BoardCertificationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BoardCertificationDetailView()
  }
}
