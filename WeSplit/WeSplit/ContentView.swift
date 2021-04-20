//
//  ContentView.swift
//  WeSplit
//
//  Created by Mu Yang on 18.4.2021.
//

import SwiftUI

struct ContentView: View { // View is a protocol
    let students = ["Harry", "Alice", "Bob"]
    @State private var chosen = 0
    
    var body: some View {
        VStack {
            Picker("Choose a student", selection: $chosen) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("Chosen: # \(students[chosen])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
