//
//  TodoListController.swift
//  TodoList
//
//  Created by Romell Bolton on 11/2/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController {
    
    // Get an instance of the managedObjectContext for this VC
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    // FetchedResultsController is going to take care of performing the fetch
    lazy var fetchedResultsController:NSFetchedResultsController<Item> = {
        
        // Create the fetch request for the Item type
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TodoListContoller Context: \(managedObjectContext.description)")
        
        // Have this VC be the delegate of the FetchedReusltsController
        fetchedResultsController.delegate = self
        
        // Perform the fetch request in a do / catch block
        do {
            // Use the fetchedResultsController to perform the fetch of data
            try fetchedResultsController.performFetch()
        } catch {
            print("Error fetching Item objects: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // Get the current section that we want from the fetched results controller
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        
        // Return the number of objects in the section
        return section.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        // Return the cell
        return configureCell(cell, at: indexPath)
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell's data
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        
        return cell
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            
            addTaskController.managedObjectContext = self.managedObjectContext
        }
    }
}

extension TodoListController: NSFetchedResultsControllerDelegate {
    // Notifies the receiver that the fetched results controller has completed processing of one or more changes due to an add, remove, move, or update.
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Reload the TableView when change in data occurs
        tableView.reloadData()
    }
}
