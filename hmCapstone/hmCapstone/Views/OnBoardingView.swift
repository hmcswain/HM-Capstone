//  hmCapstone
//  OnBoardingView.swift


import SwiftUI

struct OnBoardingView: View {
  let title: String
  let image: String
  let description: String
  
  var body: some View {
    VStack {
      Image(systemName: image)
        .resizable()
        .scaledToFill()
        .frame(width: 150, height: 150)
        .foregroundColor(.red)
        .font(.largeTitle)
        .padding()

      Text(title)
        .multilineTextAlignment(.center)
        .font(.largeTitle)
        .padding()

      Text(description)
        .multilineTextAlignment(.center)
        .font(.headline)
        .padding()
      
    }
  }
}


#Preview {
  OnBoardingView(title: "Fun Fact", image: "paperplane.fill", description: "App Development ain't for the faint hearted, but if you want to see what this does on multiple lines , here we go")
}

