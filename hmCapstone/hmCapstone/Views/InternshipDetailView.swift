//
//  InternshipDetailView.swift
//  hmCapstone
//
//  Created by Jj on 4/22/24.
//

import SwiftUI
/*
 struct InternshipDetailView: View {
 var body: some View {
 Text("Details about the Internship")
 }
 }
 
 #Preview {
 InternshipDetailView()
 }
 
 */

/*
 struct InternshipDetailView: View {
 @StateObject private var viewModel = InternshipDetailsViewModel()
 
 var body: some View {
 Form {
 Section(header: Text("Medical School Name")) {
 TextField("Enter medical school name", text: $viewModel.medicalSchoolName)
 }
 Section(header: Text("Short Name")) {
 TextField("Enter short name", text: $viewModel.shortName)
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
 .navigationTitle("Internship Details")
 }
 }
 
 struct InternshipDetailView_Previews: PreviewProvider {
 static var previews: some View {
 InternshipDetailView()
 }
 }
 
 */
/*
 import SwiftUI
 
 struct InternshipDetailView: View {
 @StateObject private var viewModel = InternshipDetailsViewModel()
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("Internship Name")) {
 TextField("Enter internship program name", text: $viewModel.internshipProgramName)
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
 .navigationTitle("Internship Details")
 }
 }
 }
 
 struct InternshipDetailView_Previews: PreviewProvider {
 static var previews: some View {
 InternshipDetailView()
 }
 }
 */

import SwiftUI

struct InternshipDetailView: View {
  @StateObject private var viewModel = InternshipDetailsViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Internship Program Name")) {
          TextField("Enter internship program name", text: $viewModel.internshipProgramName)
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
          .buttonStyle(.borderedProminent)
          Button("Clear Details") {
            viewModel.clearData()
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Internship Details")
      .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) { }
      }
    }
  }
}

struct InternshipDetailView_Previews: PreviewProvider {
  static var previews: some View {
    InternshipDetailView()
  }
}

