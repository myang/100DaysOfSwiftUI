//
//  ContentView.swift
//  Shared
//
//  Created by Mu Yang on 9.5.2021.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["Rock", "Paper", "Scissors"]
    @State private var move = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var choice = 0
    @State private var score = 0
    @State private var count = 0
    @State private var showResult = false
    @State private var result = ""
    @State private var scoreChange = ""
    
    var body: some View {
        VStack {
            Text("\(moves[move])")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.green)
                .padding()
            Text(shouldWin ? "To Win" : "To Lose")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.blue)
                .padding()

            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.moveSelected(number)
                }) {
                    Text(self.moves[number])
                        .foregroundColor(.black)
                }.padding()
            }
            Spacer()
      }
        .alert(isPresented: $showResult) {
            Alert(title: Text("\(result)"),
            message: Text("\(scoreChange)"),
            dismissButton: .default(Text("Continue")) {
                self.reset()
            })
        }
    }

    func moveSelected(_ num: Int) {
        if shouldWin {
            result = "Correct"
            scoreChange = "+1"
        } else {
            result = "Correct"

        }
    }
    
    func reset() {
        move = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
