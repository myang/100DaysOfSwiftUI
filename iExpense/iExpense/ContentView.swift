//
//  ContentView.swift
//  iExpense
//
//  Created by Eric Yang on 14.6.2021.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()

    //@State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            //VStack {
                List {
                    ForEach(expenses.items) { item in
                        Text(item.name)
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationBarTitle("iExpense")
                .navigationBarItems(trailing:
                    Button(action: {
                        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        self.expenses.items.append(expense)
                    }) {
                        Image(systemName: "plus")
                    }
                )
/*
                Button("Show sheet") {
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SecondView(name: "@blucode")
                }

                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
*/
            //}
            //.navigationBarItems(leading: EditButton())
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
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
