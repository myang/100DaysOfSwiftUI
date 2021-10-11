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

    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List (ships, id: \.self) {ship in
                Text(ship.name ?? "Unknown")
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
            
            Button("Save") {
                self.context.automaticallyMergesChangesFromParent = true
                self.context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
                
                do {
                    try self.context.save()
                } catch {
                    print(error.localizedDescription)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
