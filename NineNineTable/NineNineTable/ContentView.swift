//
//  ContentView.swift
//  NineNineTable
//
//  Created by Mu Yang on 1.6.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var settings = true
    @State private var max = 12
    @State private var questions = 5
    @State private var answer = "0"
    @State private var num1 = Int.random(in: 0...2)
    @State private var num2 = Int.random(in: 0...2)
    @State private var counter = 0

    var body: some View {
        Group {
            if settings {
                VStack {
                    Stepper(value: $max, in: 1...12) {
                            Text("Max number: \(max)")
                    }

                    Picker("Number of questions:", selection: $questions) {
                        ForEach(1 ..< 5) {
                            Text("\($0 * 5)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                }
            } else {
                VStack {
                    Section (header: Text("\(num1) x \(num2) = ?")) {
                        TextField("\(answer)", text: $answer)
                            .keyboardType(.numberPad)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
