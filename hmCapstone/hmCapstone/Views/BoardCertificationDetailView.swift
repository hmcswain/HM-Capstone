//
//  BoardCertificationDetailView.swift
//  hmCapstone
//

// original boardcertification view below that worked.
/*
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
*/


// tried solution below with error on alert bindingd
/*
import SwiftUI

struct BoardCertificationDetailView: View {
  @StateObject private var viewModel: BoardCertificationDetailsViewModel
  
  // Initialize the ViewModel with default UserDefaults
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
          DatePicker("Choose date of expiration", selection: $viewModel.certificateExpirationDate, displayedComponents: .date)
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
          .alert("Data has been successfully saved to your phone", isPresented: $viewModel.activeAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.borderedProminent)
          
          Button("Clear Details") {
            Task {
              await viewModel.clearData()
            }
          }
          .alert("All data fields in this section have been cleared.", isPresented: $viewModel.activeAlert) {
            Button("OK", role: .cancel) { }
          }
          .buttonStyle(.bordered)
          .foregroundColor(.red)
        }
      }
      .navigationTitle("Board Certification")
    }
  }
}

struct BoardCertificationDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BoardCertificationDetailView()
  }
}
*/


//newest attempt to keep functionality similar to statemedicallicesnedetail view andview model while initializig the user default.  creating structure so that I may test this .

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
                    DatePicker("Choose date of expiration", selection: $viewModel.certificateExpirationDate, displayedComponents: .date)
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

