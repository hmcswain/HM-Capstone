//
//  StateMedicalLicensesView.swift
//  hmCapstone
//
//  Created by Jj on 4/22/24.
//

import SwiftUI

struct StateMedicalLicensesView: View {
    var body: some View {
      VStack {
        Text("Hello World before I delete this view\n\nCheck this")
          .padding()
          .fixedSize(horizontal: false, vertical: true) // Allows text to expand vertically
          .lineLimit(nil) // Allows for an unlimited number of lines
        Image(systemName: "globe")
          .imageScale(.large)
      }

    }
}

#Preview {
    StateMedicalLicensesView()
}



