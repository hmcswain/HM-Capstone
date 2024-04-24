//
//  FellowshipDetailView.swift
//  hmCapstone
//

import SwiftUI
/*
 struct FellowshipDetailView: View {
 @StateObject private var viewModel = FellowshipDetailsViewModel()
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("Fellowship Program Name")) {
 TextField("Enter fellowship program name", text: $viewModel.fellowshipProgramName)
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
 Button("Save Details", action: viewModel.saveData)
 .buttonStyle(.borderedProminent)
 Button("Clear Details", action: viewModel.clearData)
 .buttonStyle(.bordered)
 .foregroundColor(.red)
 }
 }
 .navigationTitle("Fellowship Details")
 }
 }
 }
 
 struct FellowshipDetailView_Previews: PreviewProvider {
 static var previews: some View {
 FellowshipDetailView()
 }
 }
 */

import SwiftUI

struct FellowshipDetailView: View {
  @StateObject private var viewModel = FellowshipDetailsViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Fellowship Program Name")) {
          TextField("Enter fellowship program name", text: $viewModel.fellowshipProgramName)
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
            viewModel.saveData()
          }
          .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.borderedProminent)
          
          Button("Clear Details") {
            viewModel.clearData()
          }
          .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Fellowship Details")
      .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) { }
      }
    }
  }
}

struct FellowshipDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FellowshipDetailView()
  }
}

