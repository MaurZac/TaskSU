//
//  Persistence.swift
//  TaskSU
//
//  Created by Mauricio Zarate Chula on 08/09/22.
//

import CoreData

struct PersistenceController {
    //MARK: 1.- PERSISTENT CONTROLLER
    static let shared = PersistenceController()

    //MARK: 2.- PERSISTENT CONTAINER
    let container: NSPersistentContainer
    
    //MARK: 3.- INITIALIZATION (LOAD THE PERSISTENT STORE)

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskSU")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
          
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    //MARK: - 4 PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
