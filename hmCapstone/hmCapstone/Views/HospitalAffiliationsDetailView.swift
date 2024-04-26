//
//  HospitalAffiliationsDetailView.swift

/*
 import SwiftUI

 struct HospitalAffiliationsDetailView: View {
 @StateObject private var viewModel = HospitalAffiliationsDetailsViewModel()
 var body: some View {
 NavigationView {
 Form {
 Section(header: Text("Hospital Name")) {
 TextField("Enter hospital name", text: $viewModel.hospitalName)
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
 Section(header: Text("Hospital Type")) {
 TextField("Enter acute care, military, etc.", text: $viewModel.hospitalType)
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
 .navigationTitle("Hospital Affiliation")
 }
 }
 }

 struct HospitalAffiliationsDetailView_Previews: PreviewProvider {
 static var previews: some View {
 HospitalAffiliationsDetailView()
 }
 }

 */
import SwiftUI

struct HospitalAffiliationsDetailView: View {
  @StateObject private var viewModel: HospitalAffiliationsDetailsViewModel

  init() {
    _viewModel = StateObject(wrappedValue: HospitalAffiliationsDetailsViewModel(userDefaults: .standard))
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Hospital Name")) {
          TextField("Enter hospital name", text: $viewModel.hospitalName)
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
        Section(header: Text("Hospital Type")) {
          TextField("Enter acute care, military, etc.", text: $viewModel.hospitalType)
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
      .navigationTitle("Hospital Affiliation")
    }
  }
}

struct HospitalAffiliationsDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HospitalAffiliationsDetailView()
  }
}

