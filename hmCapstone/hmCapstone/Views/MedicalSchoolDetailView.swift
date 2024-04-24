import SwiftUI

struct MedicalSchoolDetailView: View {
  @StateObject private var viewModel = MedicalSchoolDetailsViewModel()
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Medical School Name")) {
          TextField("Enter medical school name", text: $viewModel.medicalSchoolName)
        }
        Section(header: Text("Short Name")) {
          TextField("Enter the short name for the school", text: $viewModel.shortName)
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
      .navigationTitle("Medical School Details")
      .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) { }
      }
    }
  }
}

struct MedicalSchoolDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MedicalSchoolDetailView()
  }
}
