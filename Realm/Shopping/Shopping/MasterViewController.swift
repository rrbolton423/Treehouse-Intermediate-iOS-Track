//
//  MasterViewController.swift
//  Shopping
//
//  Created by Romell Bolton on 10/31/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import RealmSwift

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var items: Results<Item> { // Array of Item objects
        get {
            // Return every object of the "Item" type to the array
            return realm.objects(Item.self)
        }
    }
    let realm = try! Realm() // Get an instance of Realm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
    }
    
    func setupNavigationItems() {
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            
            // Get the index path of the selected row
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                // Get the selected item, get a reference to the DetailViewController
                // and pass that item over to that VC
                let item = items[indexPath.row]
                let controller = segue.destination  as! DetailViewController
                controller.detailItem = item
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    // Tell TableView that it can edit items by implementing the below method ...
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Handle different editing styles
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // If the editing style is deletion, get the current note using the index path,
        // and delete it from the Realm database
        if editingStyle == .delete {
            let item = items[indexPath.row]
            try! realm.write {
                realm.delete(item)
            }
            
            // Delete the table view row whose content was deleted
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}









