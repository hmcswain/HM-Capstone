//  PublicDataView.swift

import SwiftUI

struct PublicDataView: View {
  @ObservedObject var providerViewModel: ProviderViewModel
  @ObservedObject var medicalSchoolDetailsViewModel = MedicalSchoolDetailsViewModel(userDefaults: .standard)
  @ObservedObject var hospitalAffiliationsDetailsViewModel = HospitalAffiliationsDetailsViewModel(
    userDefaults: .standard
  )
  @ObservedObject var boardCertificationDetailsViewModel = BoardCertificationDetailsViewModel(userDefaults: .standard)
  @ObservedObject var fellowshipDetailsViewModel = FellowshipDetailsViewModel(userDefaults: .standard)
  @ObservedObject var residencyDetailsViewModel = ResidencyDetailsViewModel(userDefaults: .standard)
  @ObservedObject var internshipDetailsViewModel = InternshipDetailsViewModel(userDefaults: .standard)
  @ObservedObject var stateMedicalLicenseDetailsViewModel = StateMedicalLicenseDetailsViewModel(userDefaults: .standard)
  @ObservedObject var employersDetailsViewModel = EmployersDetailsViewModel(userDefaults: .standard)
  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("National Provider Identifier Record")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: NPIDetailView(viewModel: providerViewModel, npi: provider.number)) {
              VStack(alignment: .leading, spacing: 4) {
                HStack {
                  Image(systemName: "number")
                    .foregroundColor(.blue)
                  Text("NPI Details")
                    .fontWeight(.semibold)
                }
                Text("NPI: \(provider.number)")
                  .font(.subheadline)
              }
            }
            .accessibilityIdentifier("NavigateToNPI-\(provider.number)")
          }
        }
        Section(header: Text("Provider Basic Information")) {
          ForEach(providerViewModel.providers, id: \.number) { provider in
            NavigationLink(destination: ProviderDetailView(provider: provider)) {
              VStack(alignment: .leading, spacing: 4) {
                HStack {
                  Image(systemName: "person.text.rectangle")
                    .foregroundColor(.blue)
                  Text("Provider Details")
                    .fontWeight(.semibold)
                }
                Text("\(provider.basic.firstName) \(provider.basic.lastName), \(provider.basic.credential ?? "")")
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Medical School")) {
          NavigationLink(destination: MedicalSchoolDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "building.columns")
                  .foregroundColor(.blue)
                Text("Medical School Details")
                  .fontWeight(.semibold)
              }
              if medicalSchoolDetailsViewModel.medicalSchoolName.isEmpty {
                Text("No medical school entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
              } else {
                Text(medicalSchoolDetailsViewModel.medicalSchoolName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Internship")) {
          NavigationLink(destination: InternshipDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "briefcase.fill")
                  .foregroundColor(.blue)
                Text("Internship Details")
                  .fontWeight(.semibold)
              }
              if internshipDetailsViewModel.internshipProgramName.isEmpty {
                Text("No internship program entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(internshipDetailsViewModel.internshipProgramName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Residency")) {
          NavigationLink(destination: ResidencyDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "stethoscope")
                  .foregroundColor(.blue)
                Text("Residency Details")
                  .fontWeight(.semibold)
              }
              if residencyDetailsViewModel.residencyProgramName.isEmpty {
                Text("No residency program entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(residencyDetailsViewModel.residencyProgramName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Fellowship")) {
          NavigationLink(destination: FellowshipDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "cross.case")
                  .foregroundColor(.blue)
                Text("Fellowship Details")
                  .fontWeight(.semibold)
              }
              if fellowshipDetailsViewModel.fellowshipProgramName.isEmpty {
                Text("No fellowship program entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(fellowshipDetailsViewModel.fellowshipProgramName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Board Certification")) {
          NavigationLink(destination: BoardCertificationDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "checkmark.seal.fill")
                  .foregroundColor(.blue)
                Text("Board Certification Details")
                  .fontWeight(.semibold)
              }
              if boardCertificationDetailsViewModel.specialtyName.isEmpty {
                Text("No board certification details entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(boardCertificationDetailsViewModel.specialtyName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("State Medical License")) {
          NavigationLink(destination: StateMedicalLicenseDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "doc.text")
                  .foregroundColor(.blue)
                Text("Medical License Details")
                  .fontWeight(.semibold)
              }
              if stateMedicalLicenseDetailsViewModel.medicalBoardName.isEmpty {
                Text("No medical board details entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(stateMedicalLicenseDetailsViewModel.medicalBoardName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Hospital Affiliation")) {
          NavigationLink(destination: HospitalAffiliationsDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "cross.circle")
                  .foregroundColor(.blue)
                Text("Hospital Affiliations Details")
                  .fontWeight(.semibold)
              }
              if hospitalAffiliationsDetailsViewModel.hospitalName.isEmpty {
                Text("No hospital entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(hospitalAffiliationsDetailsViewModel.hospitalName)
                  .font(.subheadline)
              }
            }
          }
        }
        Section(header: Text("Employers")) {
          NavigationLink(destination: EmployersDetailView()) {
            VStack(alignment: .leading, spacing: 4) {
              HStack {
                Image(systemName: "building")
                  .foregroundColor(.blue)
                Text("Employer Details")
                  .fontWeight(.semibold)
              }
              if employersDetailsViewModel.employerName.isEmpty {
                Text("No employer entered. Please enter.")
                  .foregroundColor(.secondary)
                  .italic()
                  .font(.subheadline)
              } else {
                Text(employersDetailsViewModel.employerName)
                  .font(.subheadline)
              }
            }
          }
        }
      }
      .navigationTitle("Public Data")
    }
  }
}
struct PublicDataView_Previews: PreviewProvider {
  static var previews: some View {
    PublicDataView(providerViewModel: ProviderViewModel.mock())
  }
}
