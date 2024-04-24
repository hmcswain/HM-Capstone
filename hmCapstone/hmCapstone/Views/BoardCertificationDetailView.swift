//
//  BoardCertificationDetailView.swift
//  hmCapstone
//

/*
import SwiftUI

struct BoardCertificationDetailView: View {
  @StateObject private var viewModel = BoardCertificationDetailsViewModel()
  @State private var showAlertForDateChange = false

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Specialty Name")) {
          TextField("Enter specialty name", text: $viewModel.specialtyName)
        }
        Section(header: Text("Certifying Board Name")) {
          TextField("Enter board name", text: $viewModel.certifyingBoardName)
        }
        Section(header: Text("Certificate Expiration Date")) {
          DatePicker("Choose date of expiration", selection: $viewModel.certificateExpirationDate, displayedComponents: .date)
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
      .navigationTitle("Board Certification")
      .alert("Data has been successfully saved to your phone", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) { }
      }
    }
  }
}

struct BoardCertificationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BoardCertificationDetailView()
  }
}
*/

import SwiftUI

struct BoardCertificationDetailView: View {
    @StateObject private var viewModel = BoardCertificationDetailsViewModel()
    @State private var showAlertForDateChange = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Certifying Board Name")) {
                    TextField("Enter certifying board name", text: $viewModel.certifyingBoardName)
                }
                Section(header: Text("Specialty Name")) {
                    TextField("Enter specialty name", text: $viewModel.specialtyName)
                }
                Section(header: Text("Certificate Expiration Date")) {
                    DatePicker("Choose date of expiration", selection: $viewModel.certificateExpirationDate, displayedComponents: .date)
                        .onChange(of: viewModel.certificateExpirationDate) { oldValue, newValue in
                            showAlertForDateChange = true
                        }
                }
                Section(header: Text("# of days remaining until expiration date")) {
                    Text("\(viewModel.daysUntilExpiration) days")
            //        Text("Please press Save Details button below when you select a new expiration date to calculate new # of days remaining.")
          //              .italic()
          //              .foregroundColor(.secondary)
          //              .padding(.top, 2)
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
            .navigationTitle("Board Certification")
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
    }
}

struct BoardCertificationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoardCertificationDetailView()
    }
}

