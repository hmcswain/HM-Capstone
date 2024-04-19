//  hmCapstone
//  HomeNPILookupView.swift



 import SwiftUI

 struct HomeNPILookupView: View {
 @State private var npiNumber = ""
 @State private var shouldNavigate = false
 @StateObject private var viewModel = ProviderViewModel()

 var body: some View {
 NavigationStack {
 VStack {
 TextField("Enter NPI Number", text: $npiNumber)
 .textFieldStyle(.roundedBorder)
 .padding()

 Button("Go to Details") {
 Task {
 await viewModel.fetchProviderDetails(npi: npiNumber)
 if viewModel.errorMessage == nil {
 shouldNavigate = true
 }
 }
 }
 .buttonStyle(.borderedProminent)
 .disabled(npiNumber.isEmpty)
 .padding()

 NavigationLink(destination: MainTabView(npi: npiNumber), isActive: $shouldNavigate) {
 EmptyView()
 }
 }
 .navigationTitle("NPI Lookup")
 .alert(isPresented: Binding<Bool>(
 get: { viewModel.errorMessage != nil },
 set: { _ in viewModel.errorMessage = nil }
 )) {
 Alert(title: Text("Error"),
 message: Text(viewModel.errorMessage ?? "An unexpected error occurred"),
 dismissButton: .default(Text("OK")))
 }
 }
 /*
  .navigationTitle("NPI Lookup")
  .alert("Error", isPresented: bindingToErrorMessageExists(), actions: {
  viewModel.clearErrorMessage()
  }) {
  Text(viewModel.errorMessage ?? "An unexpected error occurred")
  }
  }
  */
 }
 }

 #Preview {
 HomeNPILookupView()
 }



/*
 import SwiftUI

 struct HomeNPILookupView: View {
 @State private var npiNumber = ""
 @State private var shouldNavigate = false
 @StateObject private var viewModel = ProviderViewModel()

 var body: some View {
 NavigationStack {
 VStack {
 TextField("Enter NPI Number", text: $npiNumber)
 .textFieldStyle(.roundedBorder)
 .padding()

 Button("Go to Details") {
 Task {
 await viewModel.fetchProviderDetails(npi: npiNumber)
 if viewModel.errorMessage == nil {
 shouldNavigate = true
 }
 }
 }
 .buttonStyle(.borderedProminent)
 .disabled(npiNumber.isEmpty)
 .padding()

 // Navigation using the new API
 if shouldNavigate {
 NavigationLink(value: npiNumber) {
 EmptyView()
 }
 }

 // Define navigation destination based on the provided value
 .navigationDestination(for: String.self) { npi in
 MainTabView(npi: npi)
 }
 }
 .navigationTitle("NPI Lookup")
 .alert("Error", isPresented: Binding<Bool>(
 get: { viewModel.errorMessage != nil },
 set: { _ in viewModel.errorMessage = nil }
 ), presenting: viewModel.errorMessage) { errorMsg in
 Alert(title: Text("Error"), message: Text(errorMsg), dismissButton: .default(Text("OK")))
 }
 }
 }
 }

 struct HomeNPILookupView_Previews: PreviewProvider {
 static var previews: some View {
 HomeNPILookupView()
 }
 }

 */

/*
 import SwiftUI

 struct HomeNPILookupView: View {
 @State private var npiNumber = ""
 @State private var shouldNavigate = false
 @StateObject private var viewModel = ProviderViewModel()

 var body: some View {
 NavigationStack {
 VStack {
 TextField("Enter NPI Number", text: $npiNumber)
 .textFieldStyle(.roundedBorder)
 .padding()

 Button("Go to Details") {
 Task {
 await viewModel.fetchProviderDetails(npi: npiNumber)
 shouldNavigate = viewModel.errorMessage == nil
 }
 }
 .buttonStyle(.borderedProminent)
 .disabled(npiNumber.isEmpty)
 .padding()

 // Setup conditional NavigationLink based on shouldNavigate
 if shouldNavigate {
 NavigationLink(value: npiNumber) {
 EmptyView()
 }
 }

 // Define navigation destination based on the provided value
 navigationDestination(for: String.self) { npi in
 MainTabView(npi: npi)
 }
 }
 .navigationTitle("NPI Lookup")
 .alert("Error", isPresented: Binding<Bool>(
 get: { viewModel.errorMessage != nil },
 set: { _ in viewModel.errorMessage = nil }
 )) {
 Alert(title: Text("Error"),
 message: Text(viewModel.errorMessage ?? "An unexpected error occurred"),
 dismissButton: .default(Text("OK")))
 }
 }
 }
 }
 /*
  struct MainTabView: View {
  var npi: String
  var body: some View {
  Text("Details for NPI: \(npi)")
  }
  }
  */

 struct HomeNPILookupView_Previews: PreviewProvider {
 static var previews: some View {
 HomeNPILookupView()
 }
 }

 */
/*
import SwiftUI

struct HomeNPILookupView: View {
  @State private var npiNumber = ""
  @State private var shouldNavigate = false
  @StateObject private var viewModel = ProviderViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        TextField("Enter NPI Number", text: $npiNumber)
          .textFieldStyle(.roundedBorder)
          .padding()

        Button("Go to Details") {
          Task {
            await viewModel.fetchProviderDetails(npi: npiNumber)
            shouldNavigate = viewModel.errorMessage == nil
          }
        }
        .buttonStyle(.borderedProminent)
        .disabled(npiNumber.isEmpty)
        .padding()

        if shouldNavigate {
          NavigationLink(value: npiNumber) {
            EmptyView()
          }
        }

        navigationDestination(for: String.self) { npi in
          MainTabView(npi: npi)
        }
      }
      .navigationTitle("NPI Lookup")
      .alert(isPresented: $shouldNavigate, content: {
        Alert(title: Text("NPI Number"), message: Text("Navigating with NPI Number: \(npiNumber)"), dismissButton: .default(Text("OK")))
      })
 /*     .alert("Error", isPresented: Binding<Bool>(
        get: { viewModel.errorMessage != nil },
        set: { _ in viewModel.errorMessage = nil }
      ), presenting: viewModel.errorMessage) { errorMsg in
        Alert(title: Text("Error"), message: Text(errorMsg ?? "An unexpected error occurred"), dismissButton: .default(Text("OK")))

      }
  */
    }
  }
}
/*
struct MainTabView: View {
  var npi: String
  var body: some View {
    Text("Details for NPI: \(npi)")
  }
}
*/


struct HomeNPILookupView_Previews: PreviewProvider {
  static var previews: some View {
    HomeNPILookupView()
  }
}

*/
