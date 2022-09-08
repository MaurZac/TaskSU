//
//  TaskSUApp.swift
//  TaskSU
//
//  Created by Mauricio Zarate Chula on 08/09/22.
//

import SwiftUI

@main
struct TaskSUApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
