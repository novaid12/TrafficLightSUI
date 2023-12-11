//
//  TrafficLightSUIApp.swift
//  TrafficLightSUI
//
//  Created by  NovA on 11.12.23.
//

import SwiftUI

@main
struct TrafficLightSUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
