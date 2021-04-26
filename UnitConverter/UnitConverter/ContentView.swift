//
//  ContentView.swift
//  UnitConverter
//
//  Created by Mu Yang on 23.4.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var quantity = "1"
    @State private var unitIndex = 0
    
    let fromUnits = [
        "Fahrenheit",
        "Celsius",
        "Feet",
        "Ounce",
        "Gallon"
    ]

    let toUnits = [
        "Celsius",
        "Fahrenheit",
        "Meter",
        "Gram",
        "Liter"
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
        let number = Double(quantity) ?? 0
        
        switch fromUnits[unitIndex] {
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
                Section(header: Text("Choose a unit you want to convert from")) {
                    Picker("Units", selection: $unitIndex) {
                        ForEach(0 ..< fromUnits.count) {
                            Text("\(self.fromUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Input a value")) {
                    TextField("\(quantity)", text: $quantity)
                        .keyboardType(.numberPad)
                }

                Section (header: Text("Convert to")) {
                    Text("\(result, specifier: "%.2f") \(toUnits[unitIndex])")
                }
                
            }.navigationBarTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
