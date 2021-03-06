//
//  ContentView.swift
//  GussTheFlag
//
//  Created by Mu Yang on 26.4.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var showingScore = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var animating = false
    @State private var degree = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
            
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        //flag was tapped
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                    }
                    .opacity(animating && number != correctAnswer ? 0.1 : 1)
                    .rotation3DEffect(.degrees(number == correctAnswer ? degree : 0), axis: (x: 0, y: 1, z: 0))
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text("Your answer is \(scoreTitle)"),
                  message: Text(scoreMessage),
                  dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ num: Int) {
        if num == correctAnswer {
            score += 1
            scoreTitle = "correct"
            scoreMessage = "Score:\(score)"
            withAnimation {
                animating = true
                degree += 180}
        } else {
            scoreTitle = "wrong"
            scoreMessage = "It's \(self.countries[num])"
        }
        
        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animating = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
