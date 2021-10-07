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

    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List (wizards, id: \.self) {wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.context)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
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
