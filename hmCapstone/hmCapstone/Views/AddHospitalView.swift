
import SwiftUI

struct AddHospitalView: View {

  @Binding var hospitals: [Hospital]

  @ObservedObject var viewModel: HospitalViewModel
  @State private var name: String = ""
  @State private var address: String = ""
  @State private var city: String = ""
  @State private var state: String = ""
  @State private var zipCode: String = ""
  @State private var county = ""
  @State private var hospitalType = ""
  @State private var ownership = ""

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Hospital Information")) {

          TextField("Hospital Name", text: $name)
          TextField("Address", text: $address)
          TextField("City", text: $city)
          TextField("State", text: $state)
          TextField("Zip Code", text: $zipCode)
          TextField("County", text: $county)
          TextField("Hospital Type", text: $hospitalType)
          TextField("Ownership", text: $ownership)

          Button("Add Hospital") {
            let newHospital = Hospital(id: UUID().uuidString, name: name, address: address, city: city, state: state, zipCode: zipCode, county: "", hospitalType: "", ownership: "")
            hospitals.append(newHospital)
          }

        }
        .navigationBarTitle("Add a New Hospital")
      }

      }
    }

  private func clearFields() {
    name = ""
    address = ""
    city = ""
    state = ""
    zipCode = ""
    county = ""
    hospitalType = ""
    ownership = ""
  }
}


struct AddHospitalView_Previews: PreviewProvider {
    static var previews: some View {

        let hospitals = [
            Hospital(id: UUID().uuidString, name: "Community Hospital", address: "123 Main St", city: "Anytown", state: "CA", zipCode: "90210", county: "Orange County", hospitalType: "General", ownership: "Public")
        ]

        let bindingHospitals = Binding.constant(hospitals)
        // Create an instance of the mock view model
        let viewModel = HospitalViewModel()

        // Provide the AddHospitalView with required dependencies
        AddHospitalView(hospitals: bindingHospitals, viewModel: viewModel)
    }
}

