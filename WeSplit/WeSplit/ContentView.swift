//
//  ContentView.swift
//  WeSplit
//
//  Created by Mu Yang on 18.4.2021.
//

import SwiftUI

struct ContentView: View { // View is a protocol
    let students = ["Harry", "Alice", "Bob"]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Text("$\(checkAmount)")
                }
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
