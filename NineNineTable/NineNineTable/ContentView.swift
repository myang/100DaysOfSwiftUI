//
//  ContentView.swift
//  NineNineTable
//
//  Created by Mu Yang on 1.6.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = true
    @State private var level = 12
    @State private var questionNum = 5
    @State private var answer = "0"
    @State private var num1 = 0
    @State private var num2 = 0
    @State private var buttonAnimation = false
    @State private var enableAlert = false
    @State private var alertTitle = "Correct"
    @State private var alertMsg = ""
    @State private var counter = 0

    var body: some View {
        Group {
            if settings {
                VStack {
                    Stepper(value: $level, in: 1...12) {
                            Text("Level number: \(level)")
                    }

                    Picker("Number of questions:", selection: $questionNum) {
                        ForEach(1 ..< 5) {
                            Text("\($0 * 5)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button("Ok") {
                        withAnimation {
                            buttonAnimation.toggle()
                        }
                        num1 = Int.random(in: 0...level)
                        num2 = Int.random(in: 0...level)

                        settings = false
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .rotation3DEffect(.degrees(buttonAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))

                }
            } else {
                HStack {
                    Text("\(num1) x \(num2) =")
                        .font(.headline)
                    TextField("Answer: \(answer)", text: $answer, onCommit: getResult)
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).padding()
                }
                .alert(isPresented: $enableAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMsg),
                          dismissButton: .default(Text("OK")) {
                            self.nextQuestion()
                    })
                }
            }
        }
    }
    
    func getResult() {
        let result = Int(answer) ?? 0
        if result == num1 * num2 {
            alertTitle = "Correct"
            alertMsg = ""
        }
        else {
            alertTitle = "Wrong!"
            alertMsg = "Answer is:\(num1 * num2)"

        }
        enableAlert = true
    }
    
    func nextQuestion() {
        counter += 1
        if counter < questionNum {
            num1 = Int.random(in: 0...level)
            num2 = Int.random(in: 0...level)
        }
        else {
            counter = 0
            settings = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
