//
//  MedicalSchoolSearchView.swift
//  hmCapstone
//
//  Created by Jj on 4/22/24.
//

import SwiftUI

struct MedicalSchoolSearchView: View {
    @StateObject private var viewModel = MedicalSchoolsViewModel()
    @State private var searchText = ""
    @State private var selectedSchool: MedicalSchool?

    var body: some View {
        NavigationView {
            VStack {
                TextField("Start typing school name...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                List(viewModel.medicalSchools.filter { school in
                  searchText.isEmpty || school.medicalSchoolName.localizedCaseInsensitiveContains(searchText)
                }, id: \.id) { school in
                  NavigationLink(destination: MedicalSchoolInfoView(school: school)) {
                      Text(school.medicalSchoolName)
                  }
                }

                /*

                List(viewModel.medicalSchools.filter { searchText.isEmpty || $0.medicalSchoolName.localizedCaseInsensitiveContains(searchText) }, id: \.id) { school in
                    NavigationLink(destination: MedicalSchoolInfoView(school: school)) {
                        Text(school.medicalSchoolName)
                    }
                } */
            }
            .navigationTitle("Medical Schools")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Clear") {
                        searchText = ""
                        selectedSchool = nil
                    }
                }
            }
        }
        .onAppear {
          Task {
            await viewModel.loadMedicalSchools()
          }
        }
    }
}

struct MedicalSchoolSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalSchoolSearchView()
    }
}
