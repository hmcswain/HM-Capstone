//
//  HospitalAffiliationsDetailView.swift
//  hmCapstone
//
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
                    TextField("Enter hospital type", text: $viewModel.hospitalType)
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
            .navigationTitle("Hospital Affiliations")
            .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct HospitalAffiliationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalAffiliationsDetailView()
    }
}
