//
//  StateMedicalLicenseDetailView.swift
//  hmCapstone
//

//Original working file  - revert to this if changes fail
/*
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
 Task {
 await viewModel.saveData()
 }
 }
 .buttonStyle(.borderedProminent)

 Button("Clear Details") {
 Task {
 await viewModel.clearData()
 }
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
 */

//new code to facilitate testing and init of userdefaults
import SwiftUI

struct StateMedicalLicenseDetailView: View {
  @StateObject private var viewModel: StateMedicalLicenseDetailsViewModel

  init() {
    _viewModel = StateObject(wrappedValue: StateMedicalLicenseDetailsViewModel(userDefaults: .standard))
  }

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
            Task {
              await viewModel.saveData()
            }
          }
          .buttonStyle(.borderedProminent)

          Button("Clear Details") {
            Task {
              await viewModel.clearData()
            }
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

