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
    
    // MARK: - Fetched Results Controller Delegate
    
    // Notifies the receiver that the fetched results controller is about to start processing of one or more changes due to an add, remove, move, or update.
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    // Indicates the type of the change made in the fetch request
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            
            // Get the new index path of the to be inserted row
            guard let newIndexPath = newIndexPath else { return }
            
            // Insert
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        case .delete:
            
            // Get the index path of the to be deleted row
            guard let indexPath = indexPath else { return }
            
            // Delete
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .update, .move:
            
            // Get the index path of the to be moved, updated row
            guard let indexPath = indexPath else { return }
            
            // Reload
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    // Concludes a series of method calls that insert, delete, select, or reload rows and sections of the table view.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
