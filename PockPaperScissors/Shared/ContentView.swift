//
//  ContentView.swift
//  Shared
//
//  Created by Mu Yang on 9.5.2021.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["Rock", "Paper", "Scissors"]
    private let totalRounds = 3
    @State private var move = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var choice = 0
    @State private var score = 0
    @State private var round = 0
    @State private var showResult = false
    @State private var result = ""
    @State private var scoreMessage = ""
    
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
            message: Text("\(scoreMessage)"),
            dismissButton: .default(Text("Continue")) {
                self.reset()
            })
        }
    }

    func moveSelected(_ num: Int) {
        showResult = true
        round += 1

        if (shouldWin && num == (move + 1) % 3) ||
            (!shouldWin && num == (move + 2) % 3) {
            score += 1
            result = "Correct"
            scoreMessage = (round == totalRounds) ? "Total Score: \(score)" : "Score: +1"
            
        } else {
            score -= 1
            result = "Wrong"
            scoreMessage = (round == totalRounds) ? "Total Score: \(score)" : "Score: -1"

        }
    }
    
    func reset() {
        move = Int.random(in: 0...2)
        shouldWin = Bool.random()
        if (round == totalRounds) {
            round = 0
            score = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
