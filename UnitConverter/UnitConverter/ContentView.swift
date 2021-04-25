//
//  ContentView.swift
//  UnitConverter
//
//  Created by Mu Yang on 23.4.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var quantity = ""
    @State private var unitIndex = 0
    
    let unitNames = [
        "Fahrenheit",
        "Celsius",
        "Feet",
        "Ounce",
        "Gallon"
    ]
    /*
    enum Units {
        case Fahrenheit
        case Celsius
        case Feet
        case Ounce
        case Gallon
    }
*/
    var result: Double {
        var converted: Double
        var number = Double(quantity) ?? 0
        
        switch unitNames[unitIndex] {
        case "Fahrenheit":
            converted = (number - 32) * 5 / 9
        case "Celsius":
            converted = (number * 9 / 5) + 32
        case "Feet":
            converted = number / 3.281
        case "Ounce":
            converted = number * 28.35
        case "Gallon":
            converted = number * 3.785
        default:
            converted = number
        }
        return converted
    }

    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Input a value")) {
                    TextField("Amount:", text: $quantity)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Choose a unit you want to convert")) {
                    Picker("Units", selection: $unitIndex) {
                        ForEach(0 ..< unitNames.count) {
                            Text("\(self.unitNames[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Convert to")) {
                    Text("$\(result, specifier: "%.2f")")
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
