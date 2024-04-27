//  BoardCertificationDetailView.swift

import SwiftUI

struct BoardCertificationDetailView: View {
  @StateObject private var viewModel: BoardCertificationDetailsViewModel
  init() {
    _viewModel = StateObject(wrappedValue: BoardCertificationDetailsViewModel(userDefaults: .standard))
  }
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
          DatePicker(
            "Choose date of expiration",
            selection: $viewModel.certificateExpirationDate,
            displayedComponents: .date)
        }
        Section(header: Text("# of days remaining until expiration date")) {
          Text("\(viewModel.daysUntilExpiration) days")
        }
        Section {
          Button("Save Details") {
            Task {
              viewModel.saveData()
            }
          }
          .buttonStyle(.borderedProminent)
          Button("Clear Details") {
            Task {
              viewModel.clearData()
            }
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Board Certification")
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
struct BoardCertificationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BoardCertificationDetailView()
  }
}
