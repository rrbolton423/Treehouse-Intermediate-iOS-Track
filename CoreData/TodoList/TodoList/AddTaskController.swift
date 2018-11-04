//
//  AddTaskController.swift
//  TodoList
//
//  Created by Romell Bolton on 11/2/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {
    
    // Get an instance of ManagedObjectContext from the CoreDataStack
    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("AddTaskController Context: \(managedObjectContext.description)")
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        // Get the text from the TextField
        guard let text = textField.text, !text.isEmpty else { return }
        
        // Create an instance of Item, inserting it into the ManagedObjectContext, and then return that instance for us to use
        // NSEntityDescription is the class we use to inform the managed object context that we would like to insert a new item
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        
        // Assign text from the TextField to the instance
        item.text = text
        
        // Save the changes made to the context
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
}
