//
//  TodoFetchedResultsController.swift
//  TodoList
//
//  Created by Romell Bolton on 11/4/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import CoreData

// This class initializes the controller and automatically goes and peforms the fetch of the data
class TodoFetchedResultsController: NSFetchedResultsController<Item>, NSFetchedResultsControllerDelegate {
    private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, tableView: UITableView) {
        self.tableView = tableView
        super.init(fetchRequest: Item.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    func tryFetch() {
        do {
            try performFetch()
        } catch {
            print("Unresolved error: \(error.localizedDescription)")
        }
    }
    
    // MAKR: - Fetched Results Controller Delegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Reload the TableView when change in data occurs
        tableView.reloadData()
    }
}
