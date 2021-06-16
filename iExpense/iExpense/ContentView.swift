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
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Show sheet") {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SecondView(name: "@blucode")
                }

                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
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
