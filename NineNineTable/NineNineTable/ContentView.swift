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
    @State private var questions = 5
    @State private var answer = "0"
    @State private var num1 = Int.random(in: 0...2)
    @State private var num2 = Int.random(in: 0...2)
    @State private var counter = 0
    @State private var buttonAnimation = false
    @State private var enableAlert = false
    @State private var alertTitle = "Correct"
    @State private var alertMsg = ""

    var body: some View {
        Group {
            if settings {
                VStack {
                    Stepper(value: $level, in: 1...12) {
                            Text("Level number: \(level)")
                    }

                    Picker("Number of questions:", selection: $questions) {
                        ForEach(1 ..< 5) {
                            Text("\($0 * 5)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Button("Ok") {
                        settings = false
                        withAnimation {
                            buttonAnimation.toggle()
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(buttonAnimation ? Color.blue : Color.red)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .rotation3DEffect(.degrees(buttonAnimation ? 360 : 0), axis: (x: 0, y: 1, z: 0))

                }
            } else {
                VStack {
                    Section (header: Text("\(num1) x \(num2) = ?")) {
                        TextField("Answer: \(answer)", text: $answer, onCommit: getResult)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).padding()
                    }
                }
                .alert(isPresented: $enableAlert) {
                    Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
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
    
    func showResult() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
