//
//  EmployersDetailView.swift
//  hmCapstone
//


import SwiftUI

struct EmployersDetailView: View {
  @StateObject private var viewModel = EmployersDetailsViewModel()

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Employer Name")) {
          TextField("Enter employer name", text: $viewModel.employerName)
        }
        Section(header: Text("Street Address 1")) {
          TextField("Enter street address 1", text: $viewModel.streetAddress1)
        }
        Section(header: Text("Street Address 2")) {
          TextField("Enter street address 2", text: $viewModel.streetAddress2)
        }
        Section(header: Text("City")) {
          TextField("Enter city", text: $viewModel.city)
        }
        Section(header: Text("State")) {
          TextField("Enter state", text: $viewModel.state)
        }
        Section(header: Text("Zip Code")) {
          TextField("Enter zipcode", text: $viewModel.zipCode)
        }
        Section(header: Text("Employer Type")) {
          TextField("Enter W2 or 1099", text: $viewModel.employerType)
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
      .navigationTitle("Employer Details")
    }
  }
}

struct EmployersDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EmployersDetailView()
  }
}

