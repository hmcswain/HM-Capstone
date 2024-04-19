
//  PrivateDataView.swift
//  hmCapstone


import SwiftUI

struct PrivateDataView: View {
    @AppStorage("dateOfBirth") private var dateOfBirth = ""
    @AppStorage("countryOfCitizenship") private var countryOfCitizenship = ""
    @AppStorage("homeAddress") private var homeAddress = ""
    @AppStorage("socialSecurityNumber") private var socialSecurityNumber = ""

    var body: some View {
        Form {
            Section(header: Text("Private Information")) {
                TextField("Date of Birth", text: $dateOfBirth)
                TextField("Country of Citizenship", text: $countryOfCitizenship)
                TextField("Home Address", text: $homeAddress)
                SecureField("Social Security Number", text: $socialSecurityNumber)
            }
            Button("Save Details") {

                print("Details saved")
            }
        }
        .navigationTitle("Private Data")
        .padding()
    }
}


#Preview {
    PrivateDataView()
}

