
//  PrivateDataView.swift
//  hmCapstone


import SwiftUI
/*
 struct PrivateDataView: View {
 @AppStorage("dateOfBirth") private var dateOfBirth = ""
 @AppStorage("countryOfCitizenship") private var countryOfCitizenship = ""
 @AppStorage("homeAddress") private var homeAddress = ""
 @AppStorage("socialSecurityNumber") private var socialSecurityNumber = ""

 var body: some View {
 Form {
 Section(header: Text("Private Information")) {
 TextField("Date of Birth", text: $dateOfBirth)
 TextField("Country of Citizenship", text: $countryOfCitizenship)
 TextField("Home Address", text: $homeAddress)
 SecureField("Social Security Number", text: $socialSecurityNumber)
 }
 Button("Save Details") {

 print("Details saved")
 }
 }
 .navigationTitle("Private Data")
 .padding()
 }
 }


 #Preview {
 PrivateDataView()
 }

 */

import SwiftUI

struct PrivateDataView: View {
  @StateObject private var viewModel = PrivateDataViewModel()

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Date of Birth")) {
          DatePicker("Select your date of birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
        }

        //      Section(header: Text("Date of Birth")) {
        //        DatePicker("Select your date of birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
        //          .datePickerStyle(CompactDatePickerStyle())
        //      }
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
            Button(action: {
              viewModel.isSSNVisible.toggle()
            }) {
              Image(systemName: viewModel.isSSNVisible ? "eye" : "eye.slash")
            }
          }
        }
        Section(header: Text("Personal Email")) {
          TextField("Enter your email", text: $viewModel.personalEmail)
            .onChange(of: viewModel.personalEmail) { oldValue, newValue in
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
            .onChange(of: viewModel.personalPhone) { oldValue, newValue in
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

