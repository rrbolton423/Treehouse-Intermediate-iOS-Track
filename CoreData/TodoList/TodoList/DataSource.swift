//
//  DataSource.swift
//  TodoList
//
//  Created by Romell Bolton on 11/4/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    private let context: NSManagedObjectContext
    
    lazy var fetchedResultsController:TodoFetchedResultsController = {
        return TodoFetchedResultsController(managedObjectContext: self.context, tableView: self.tableView)
    }()
    
    init(tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        self.context = context
    }
    
    func object(at indexPath: IndexPath) -> Item {
        return fetchedResultsController.object(at: indexPath)
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // Get the current section that we want from the fetched results controller
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        
        // Return the number of objects in the section
        return section.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        // Return the cell
        return configureCell(cell, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // Get the item we want to delete and ask the context to delete it
        let item = fetchedResultsController.object(at: indexPath)
        context.delete(item)
        context.saveChanges()
        
    }
    
    func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell's data
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        
        return cell
    }
    
    
}
