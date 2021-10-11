//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Eric Yang on 5.10.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context

    @State private var nameFilter = ""
    
    var body: some View {
        VStack {
            FilterList(filterKey: "name", filterValue: nameFilter) {(ship: Ship) in
                Text("\(ship.wrappedName) \(ship.wrappedUniverse)")
            }
            
            Button("Add") {
                let ship1 = Ship(context: self.context)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: self.context)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: self.context)
                ship3.name = "Millennnium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: self.context)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.context.save()
            }
            
            Button("Show D*") {
                self.nameFilter = "D"
            }
            
            Button("Show M*") {
                self.nameFilter = "M"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
