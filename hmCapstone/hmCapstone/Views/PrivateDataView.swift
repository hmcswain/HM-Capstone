//  PrivateDataView.swift

import SwiftUI

struct PrivateDataView: View {
  @StateObject private var viewModel = PrivateDataViewModel()
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Date of Birth")) {
          DatePicker("Select your date of birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
        }
        Section(header: Text("Country of Citizenship")) {
          TextField("Enter country of citizenship", text: $viewModel.countryOfCitizenship)
        }
        Section(header: Text("Home Address")) {
          TextField("Street Address 1", text: $viewModel.streetAddress1)
          TextField("Street Address 2", text: $viewModel.streetAddress2)
          TextField("City", text: $viewModel.city)
          TextField("State", text: $viewModel.state)
          TextField("Zip Code", text: $viewModel.zipCode)
        }
        Section(header: Text("Social Security Number")) {
          HStack {
            if viewModel.isSSNVisible {
              TextField("Enter SSN-9 digits only, no dashes", text: $viewModel.socialSecurityNumber)
            } else {
              SecureField("Enter SSN-9 digits only, no dashes", text: $viewModel.socialSecurityNumber)
            }
            Button {
              viewModel.isSSNVisible.toggle()
            } label: {
              Image(systemName: viewModel.isSSNVisible ? "eye" : "eye.slash")
            }
          }
        }
        Section(header: Text("Personal Email")) {
          TextField("Enter your email", text: $viewModel.personalEmail)
            .onChange(of: viewModel.personalEmail) { _, _ in
              viewModel.validateEmail()
            }
          if !viewModel.emailError.isEmpty {
            Text(viewModel.emailError)
              .font(.caption)
              .foregroundColor(.red)
          }
        }
        Section(header: Text("Personal Cell Phone")) {
          TextField("Enter your cell number-no dashes or ()", text: $viewModel.personalPhone)
            .onChange(of: viewModel.personalPhone) { _, _ in
              viewModel.validatePhone()
            }
          if !viewModel.phoneError.isEmpty {
            Text(viewModel.phoneError)
              .font(.caption)
              .foregroundColor(.red)
          }
        }
        Section {
          Button("Save Details") {
            Task {
              await viewModel.saveData()
            }
          }
          .buttonStyle(.borderedProminent)
          .alert("Data has been successfully saved to your device.", isPresented: $viewModel.showSaveAlert) {
            Button("OK", role: .cancel) { }
          }
          Button("Clear Details") {
            Task {
              await viewModel.clearData()
            }
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
          .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
            Button("OK", role: .cancel) { }
          }
        }
      }
      .navigationTitle("Private Data")
    }
  }
}
struct PrivateDataView_Previews: PreviewProvider {
  static var previews: some View {
    PrivateDataView()
  }
}
