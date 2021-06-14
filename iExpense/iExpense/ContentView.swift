//
//  ContentView.swift
//  iExpense
//
//  Created by Eric Yang on 14.6.2021.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Eric"
    @Published var lastName = "Young"
}

struct ContentView: View {
    @ObservedObject var user = User()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
