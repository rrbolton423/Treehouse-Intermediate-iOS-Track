//
//  CoreDataStack.swift
//  TodoList
//
//  Created by Romell Bolton on 11/1/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
//    // We can only modify private(set) these properties from inside the class, but we
//    // can access their values from aywhere (get)
//    private(set) lazy var applicationDocumentsDirectory: URL = {
//
//        // Return an array of URL's in the user's document directory
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        // Get the last url in the array
//        let endIndex = urls.index(before: urls.endIndex)
//
//        // Return the url to store data to
//        return urls[endIndex]
//    }()
//
//    // The NSManagedObjectModel instance describes the data that is going to be accessed by the Core Data stack.
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//
//        // Create the Url for the ObjectModel
//        let modelUrl = Bundle.main.url(forResource: "TodoList", withExtension: "momd")!
//
//        // Return the Object Model with URL
//        return NSManagedObjectModel(contentsOf: modelUrl)!
//    }()
//
//    // The persistent store sits in the middle of the stack and is responsible for
//    // realizing instances of entities that are defined in the managed object model.
//    // It creates new instances of those entities and it retrieves existing instances from a persistent storm.
//    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//
//        // Now we have a coordinator that is hooked up to our managed object model.
//        // So, once it has an a managedObjectModel, knows how to create these things.
//        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//
//        // Specify where we want to save the data, with SQL path component
//        let url = self.applicationDocumentsDirectory.appendingPathComponent("TodoList.sqlite")
//
//        do {
//            // Add the PersistentStore of type SQLite db
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
//        } catch {
//            print(error)
//            abort()
//        }
//
//        return coordinator
//    }()
    
    // The managed object context will be keeping track of all the changes that happen
    // across our object graph layer. All managed objects, which we have access to via the managed object model, must be registered with a managed object context.
    // The NCMAnagedObjectContext is an object representing a single object space or scratch pad that you use to fetch, create, and save managed objects.
    lazy var managedObjectContext: NSManagedObjectContext = {
        
        // Get the Persistent Container
        let container = self.persistentContainer
        
        // Return the container's object context
        return container.viewContext
    }()
    
    // NSPersistentContainer handles the creation of the managedObjectModel,
    // the persistentStoreCoordinator, and the managedObjectContext automatically for
    // us with just a few lines of code. It encapsulates the Core Data stack in your application.
    private lazy var persistentContainer: NSPersistentContainer = {
        
        // Create a Persistent Container, that encapsulates the Core Data stack
        // within the application
        let container = NSPersistentContainer(name: "TodoList")
        
        // Instructs the persistent container to load the persistent stores.
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
        }
        
        // Return the persistent container to be used in the NSManagedObjectContext
        return container
    }()
}

// This method will call save on the Context.
// It is called only when there are actual changes that need to be saved, very expensive operation.
extension NSManagedObjectContext {
    func saveChanges() {
        if self.hasChanges {
            do {
                // Call save on the Context
                try self.save()
            } catch {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}

