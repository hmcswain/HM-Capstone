//  hmCapstone
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

          VStack {
            Text("Digitizing medical identity....")
              .font(.headline)
              .fontWeight(.medium)
            Text("to save time and paper")
              .font(.headline)
              .fontWeight(.medium)
          }
          .multilineTextAlignment(.center)
          .opacity(opacity) // Apply the same fading effect to the text
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //     .background(Color.white.edgesIgnoringSafeArea(.all))
        .opacity(opacity)
        .onAppear {
          fadeOutEffect()
          UserDefaults.standard.welcomeScreenShown  = true

        }
      }
    }
  }
  
  func fadeOutEffect() {
    Task {
      try await Task.sleep(nanoseconds: 2_000_000_000) // Wait for 1 seconds
      withAnimation(.easeInOut(duration: 2)) {
        self.opacity = 0
      }
      try await Task.sleep(nanoseconds: 1_500_000_000) // Wait for an additional 1 seconds
      isActive = true
      
    }
  }
}


#Preview {
  WelcomeScreenView()
}
