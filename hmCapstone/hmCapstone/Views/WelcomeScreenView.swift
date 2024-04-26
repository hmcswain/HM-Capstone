//  WelcomeScreenView.swift

import SwiftUI

struct WelcomeScreenView: View {
  @State private var isActive = false
  @State private var opacity = 1.0


  var body: some View {
    Group {
      if isActive {
        ContentView()
      } else {
        VStack {
          Image("MediBlockLogoStacked")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .accessibilityIdentifier("MediBlockLogoStacked") //added for ui test
            .opacity(opacity) //added for ui test

          VStack {
            Text("Digitizing medical identity....")
              .font(.headline)
              .fontWeight(.medium)
              .accessibilityIdentifier("DigitizingIdentityText") // Accessibility identifier adde
            Text("to save time and paper")
              .font(.headline)
              .fontWeight(.medium)
              .accessibilityIdentifier("SaveTimeText") // Accessibility identifier added
          }
          .multilineTextAlignment(.center)
          .opacity(opacity)
          if opacity > 0 {
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .blue))
              .scaleEffect(1.5)
              .padding()
              .accessibilityIdentifier("ProgressView") // Accessibility identifier added
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(opacity)
        .onAppear {
          fadeOutEffect()
          UserDefaults.standard.welcomeScreenShown = true
        }
      }
    }
  }

  func fadeOutEffect() {
    Task {
      try await Task.sleep(nanoseconds: 2_000_000_000)
      withAnimation(.easeInOut(duration: 2)) {
        self.opacity = 0
      }
      try await Task.sleep(nanoseconds: 1_500_000_000)
      isActive = true
    }
  }
}


#Preview {
  WelcomeScreenView()
}
