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
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "@blucode")
        }
    }
}

struct SecondView: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
