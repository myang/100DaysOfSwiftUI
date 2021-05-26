//
//  ContentView.swift
//  Animations
//
//  Created by Mu Yang on 26.5.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()

            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(.easeInOut(duration: 2))
            //.blur(radius: (animationAmount - 1) * 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
