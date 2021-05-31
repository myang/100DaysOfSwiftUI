//
//  ContentView.swift
//  Animations
//
//  Created by Mu Yang on 26.5.2021.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        VStack {
            Button("Tape Me") {
                withAnimation /*(.interpolatingSpring(stiffness: 5, damping: 1))*/ {
                    //self.animationAmount += 360
                    self.enabled.toggle()
                }
            }
            .frame(width: 200, height: 200)
            .background(enabled ? Color.blue : Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .rotation3DEffect(.degrees(enabled ? 360 : 0), axis: (x: 0, y: 1, z: 0))
/*
            if enabled {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
*/
 }
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(self.letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(self.enabled ? Color.blue : Color.red)
                    .offset(self.dragAmount)
                    .animation(Animation.default.delay(Double(num) / 20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged {self.dragAmount = $0.translation}
                .onEnded {_ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
