//
//  StateMedicalLicensesView.swift
//  hmCapstone
//
//  Created by Jj on 4/22/24.
//

import SwiftUI

struct StateMedicalLicensesView: View {
    var body: some View {
      Text("Details about the Provider's State Medical Licenses")
        .padding()
        .fixedSize(horizontal: false, vertical: true) // Allows text to expand vertically
        .lineLimit(nil) // Allows for an unlimited number of lines
    }
}

#Preview {
    StateMedicalLicensesView()
}
