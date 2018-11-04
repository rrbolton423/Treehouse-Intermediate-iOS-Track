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
    lazy var fetchedResultsController:TodoFetchedResultsController = {
      
        return TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, tableView: self.tableView)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Get the item we want to delete and ask the context to delete it
        let item = fetchedResultsController.object(at: indexPath)
        managedObjectContext.delete(item)
        managedObjectContext.saveChanges()
        
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell's data
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            
            let item = fetchedResultsController.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }
}
