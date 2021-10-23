//
//  FriendsApp.swift
//  Friends
//
//  Created by Eric Yang on 23.10.2021.
//

import SwiftUI

@main
struct FriendsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
