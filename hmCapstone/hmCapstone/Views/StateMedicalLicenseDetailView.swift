//
//  StateMedicalLicenseDetailView.swift
//  hmCapstone
//
//  Created by Jj on 4/24/24.
//

import SwiftUI
/*
 struct StateMedicalLicenseDetailView: View {
 var body: some View {
 VStack {
 Text("Details about the Provider's State Medical Licenses")
 .padding()
 .fixedSize(horizontal: false, vertical: true) // Allows text to expand vertically
 .lineLimit(nil) // Allows for an unlimited number of lines
 }
 }
 }
 
 #Preview {
 StateMedicalLicenseDetailView()
 }
 
 
 */
/*
 import SwiftUI
 
 struct StateMedicalLicenseDetailView: View {
 @StateObject private var viewModel = StateMedicalLicenseDetailsViewModel()
 @State private var showAlertForDateChange = false
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("State Medical Board Name")) {
 TextField("Enter medical board name", text: $viewModel.medicalBoardName)
 }
 Section(header: Text("Issuing State")) {
 TextField("Enter state name or two-letter abbreviation", text: $viewModel.issuingState)
 }
 Section(header: Text("License #")) {
 TextField("Enter license number", text: $viewModel.licenseNumber)
 }
 Section(header: Text("License Expiration Date")) {
 DatePicker("Choose date of expiration", selection: $viewModel.licenseExpirationDate, displayedComponents: .date)
 .onChange(of: \.licenseExpirationDate, in: viewModel) { _ in
 showAlertForDateChange = true
 }
 }
 Section(header: Text("# of days remaining until expiration date")) {
 Text("\(viewModel.daysUntilExpiration) days")
 }
 Section {
 Button("Save Details") {
 viewModel.saveData()
 }
 //         .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
 //          Button("OK", role: .cancel) { }
 //        }
 .buttonStyle(.borderedProminent)
 
 Button("Clear Details") {
 viewModel.clearData()
 }
 //       .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
 //           Button("OK", role: .cancel) { }
 //          }
 .buttonStyle(.bordered)
 .foregroundColor(.red)
 }
 }
 .navigationTitle("Medical License")
 .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
 Button("OK", role: .cancel) { }
 }
 .alert("Please press Save Details button below to calculate new # of days remaining until expiration date", isPresented: $showAlertForDateChange) {
 Button("OK", role: .cancel) { }
 }
 .alert(isPresented: $viewModel.showClearAlert) {
 Alert(title: Text("All data fields in this section have been cleared."), dismissButton: .default(Text("OK")))
 }
 
 }
 }
 }
 
 struct StateMedicalLicenseDetailView_Previews: PreviewProvider {
 static var previews: some View {
 StateMedicalLicenseDetailView()
 }
 }
 */




/*
 import SwiftUI
 
 struct StateMedicalLicenseDetailView: View {
 @StateObject private var viewModel = StateMedicalLicenseDetailsViewModel()
 @State private var showAlertForDateChange = false
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("State Medical Board Name")) {
 TextField("Enter medical board name", text: $viewModel.medicalBoardName)
 }
 Section(header: Text("Issuing State")) {
 TextField("Enter state name or two-letter abbreviation", text: $viewModel.issuingState)
 }
 Section(header: Text("License #")) {
 TextField("Enter license number", text: $viewModel.licenseNumber)
 }
 Section(header: Text("License Expiration Date")) {
 DatePicker("Choose date of expiration", selection: $viewModel.licenseExpirationDate, displayedComponents: .date)
 .onChange(of: viewModel.licenseExpirationDate) { oldValue, newValue in
 showAlertForDateChange = true
 }
 }
 Section(header: Text("# of days remaining until expiration date")) {
 Text("\(viewModel.daysUntilExpiration) days")
 //     Text("Please press Save Details button below when you select a new expiration date to calculate new # of days remaining.")
 //                   .italic()
 //                 .foregroundColor(.secondary)  // Optional: Using a less prominent color for the instruction
 //         .padding(.top, 2)
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
 .navigationTitle("Medical License")
 .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
 Button("OK", role: .cancel) { }
 }
 .alert("Please press Save Details button below to calculate new # of days remaining until expiration date", isPresented: $showAlertForDateChange) {
 Button("OK", role: .cancel) {
 showAlertForDateChange = false
 }
 }
 .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
 Button("OK", role: .cancel) { }
 }
 }
 }a
 }
 
 struct StateMedicalLicenseDetailView_Previews: PreviewProvider {
 static var previews: some View {
 StateMedicalLicenseDetailView()
 }
 }
 */


/*
 import SwiftUI
 
 struct StateMedicalLicenseDetailView: View {
 @StateObject private var viewModel = StateMedicalLicenseDetailsViewModel()
 @State private var showAlertForDateChange = false
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("State Medical Board Name")) {
 TextField("Enter medical board name", text: $viewModel.medicalBoardName)
 }
 Section(header: Text("Issuing State")) {
 TextField("Enter state name or two-letter abbreviation", text: $viewModel.issuingState)
 }
 Section(header: Text("License #")) {
 TextField("Enter license number", text: $viewModel.licenseNumber)
 }
 Section(header: Text("License Expiration Date")) {
 DatePicker("Choose date of expiration", selection: $viewModel.licenseExpirationDate, displayedComponents: .date)
 .onChange(of: viewModel.licenseExpirationDate) { oldValue, newValue in
 showAlertForDateChange = true
 }
 }
 Section(header: Text("# of days remaining until expiration date")) {
 Text("\(viewModel.daysUntilExpiration) days")
 }
 Section {
 Button("Save Details") {
 viewModel.saveData()
 showAlertForDateChange = false // Reset the alert state here
 }
 .buttonStyle(.borderedProminent)
 .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
 Button("OK", role: .cancel) { }
 }
 
 Button("Clear Details") {
 viewModel.clearData()
 showAlertForDateChange = false // Reset the alert state here
 }
 .buttonStyle(.bordered)
 .foregroundColor(.red)
 .alert("All data fields in this section have been cleared.", isPresented: $viewModel.showClearAlert) {
 Button("OK", role: .cancel) { }
 }
 }
 }
 .navigationTitle("Medical License")
 .alert("Please press Save Details button below to calculate new # of days remaining until expiration date", isPresented: $showAlertForDateChange) {
 Button("OK", role: .cancel) {
 showAlertForDateChange = false // Reset alert state on dismissal
 }
 }
 }
 }
 }
 
 struct StateMedicalLicenseDetailView_Previews: PreviewProvider {
 static var previews: some View {
 StateMedicalLicenseDetailView()
 }
 }
 
 */

/*
 import SwiftUI
 
 struct StateMedicalLicenseDetailView: View {
 @StateObject private var viewModel = StateMedicalLicenseDetailsViewModel()
 @State private var showAlertForDateChange = false
 
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("State Medical Board Name")) {
 TextField("Enter medical board name", text: $viewModel.medicalBoardName)
 }
 Section(header: Text("Issuing State")) {
 TextField("Enter state name or two-letter abbreviation", text: $viewModel.issuingState)
 }
 Section(header: Text("License #")) {
 TextField("Enter license number", text: $viewModel.licenseNumber)
 }
 Section(header: Text("License Expiration Date")) {
 DatePicker("Choose date of expiration", selection: $viewModel.licenseExpirationDate, displayedComponents: .date)
 }
 Section(header: Text("# of days remaining until expiration date")) {
 Text("\(viewModel.daysUntilExpiration) days")
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
 .navigationTitle("Medical License")
 .alert(item: $viewModel.activeAlert) { activeAlert in
 switch activeAlert {
 case .saveAlert:
 return Alert(title: Text("Data has been successfully saved to your phone"))
 case .clearAlert:
 return Alert(title: Text("All data fields in this section have been cleared."))
 default:
 return Alert(title: Text("Unknown alert"))
 }
 }
 }
 }
 }
 
 struct StateMedicalLicenseDetailView_Previews: PreviewProvider {
 static var previews: some View {
 StateMedicalLicenseDetailView()
 }
 }
 
 */


import SwiftUI

struct StateMedicalLicenseDetailView: View {
  @StateObject private var viewModel = StateMedicalLicenseDetailsViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("State Medical Board Name")) {
          TextField("Enter medical board name", text: $viewModel.medicalBoardName)
        }
        Section(header: Text("Issuing State")) {
          TextField("Enter state name or two-letter abbreviation", text: $viewModel.issuingState)
        }
        Section(header: Text("License #")) {
          TextField("Enter license number", text: $viewModel.licenseNumber)
        }
        Section(header: Text("License Expiration Date")) {
          DatePicker("Choose date of expiration", selection: $viewModel.licenseExpirationDate, displayedComponents: .date)
        }
        Section(header: Text("# of days remaining until expiration date")) {
          Text("\(viewModel.daysUntilExpiration) days")
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
      .navigationTitle("State Medical License")
      .alert(item: $viewModel.activeAlert) { activeAlert in
        switch activeAlert {
        case .saveAlert:
          return Alert(title: Text("Data has been successfully saved to your phone"))
        case .clearAlert:
          return Alert(title: Text("All data fields in this section have been cleared."))
        default:
          return Alert(title: Text("Unknown alert"))
        }
      }
    }
  }
}

struct StateMedicalLicenseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    StateMedicalLicenseDetailView()
  }
}

