//
//  MedicalSchoolInfoView.swift
//  hmCapstone
//
//  Created by Jj on 4/22/24.
//

import SwiftUI

/*

struct MedicalSchoolInfoView: View {
    var school: MedicalSchool

    var body: some View {
        List {
            Section(header: Text("Name")) {
                Text(school.medicalSchoolName)
            }
            Section(header: Text("Short Name")) {
                Text(school.shortName)
            }
            Section(header: Text("Location")) {
                Text("\(school.medicalSchoolCity), \(school.medicalSchoolState)")
            }
            Section(header: Text("Region")) {
                Text(school.medicalSchoolRegion)
            }
            Section(header: Text("Ownership")) {
                Text(school.ownershipControl)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MedicalSchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalSchoolInfoView(school: MedicalSchool(
            id: "1",
            medicalSchoolName: "Harvard Medical School",
            shortName: "Harvard",
            medicalSchoolCity: "Boston",
            medicalSchoolState: "Massachusetts",
            medicalSchoolRegion: "Northeast",
            ownershipControl: "Private"
        ))
    }
}
*/

import SwiftUI

struct MedicalSchoolInfoView: View {
    var school: MedicalSchool

    var body: some View {
        List {
            Section(header: Text("Name")) {
                Text(school.medicalSchoolName)
            }
            Section(header: Text("Short Name")) {
                Text(school.shortName)
            }
            Section(header: Text("Location")) {
                Text("\(school.medicalSchoolCity), \(school.medicalSchoolState)")
            }
            Section(header: Text("Region")) {
                Text(school.medicalSchoolRegion)
            }
            Section(header: Text("Ownership")) {
                Text(school.ownershipControl)
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MedicalSchoolInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MedicalSchoolInfoView(school: MedicalSchool(id: 1, medicalSchoolName: "Harvard Medical School", shortName: "Harvard", medicalSchoolCity: "Boston", medicalSchoolState: "Massachusetts", medicalSchoolRegion: "Northeast", ownershipControl: "Private"))
    }
}

