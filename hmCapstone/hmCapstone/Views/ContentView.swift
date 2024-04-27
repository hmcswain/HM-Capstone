//  ContentView.swift

import SwiftUI

extension UserDefaults {
  var welcomeScreenShown: Bool {
    get {
      return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
    }
    set {
      UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
    }
  }
}
struct ContentView: View {
  @State private var showNPILookup = false
  var body: some View {
    if UserDefaults.standard.welcomeScreenShown && showNPILookup {
      HomeNPILookupView()
    } else if !UserDefaults.standard.welcomeScreenShown && !showNPILookup {
      WelcomeScreenView()
    } else {
      VStack {
        TabView {
          OnBoardingView(
            title: "Welcome to MediBlock App",
            image: "doc.on.doc",
            description: "Are you tired of dealing with paperwork?\n \n Swipe left or press Get Started"
          )
          OnBoardingView(
            title: "MediBlock is digitizing your medical identity to save you hours of time every week",
            image: "scanner",
            description: "Swipe left or press Get Started"
          )
          OnBoardingView(
            title: "What are you waiting for?",
            image: "macbook.and.iphone",
            description: "Press Get Started button below"
          )
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .edgesIgnoringSafeArea(.all)
        Spacer()
        Button("Get Started") {
          showNPILookup.toggle()
        }
        .padding()
        .font(.title3)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding(.bottom)
        .accessibilityIdentifier("Get Started") // Adding accessibility identifier here
      }
    }
  }
}
#Preview {
  ContentView()
}
