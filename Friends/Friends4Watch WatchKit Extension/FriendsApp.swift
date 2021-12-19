//
//  FriendsApp.swift
//  Friends4Watch WatchKit Extension
//
//  Created by Eric Yang on 30.10.2021.
//

import SwiftUI

@main
struct FriendsApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
