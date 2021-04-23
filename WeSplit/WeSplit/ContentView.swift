//
//  ContentView.swift
//  WeSplit
//
//  Created by Mu Yang on 18.4.2021.
//

import SwiftUI

struct ContentView: View { // View is a protocol
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Total amount")) {
                    TextField("Amount:", text: $checkAmount)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Tip you want to leave")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 11) {
                        Text("\($0) people")
                    }
                }

                Section (header: Text("Share per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f") /person")
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
