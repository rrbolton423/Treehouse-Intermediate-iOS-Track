//
//  Item+CoreDataProperties.swift
//  TodoList
//
//  Created by Romell Bolton on 11/3/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        
        // Create a NSFetchRequest for a specific type "Item"
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        // Set the sort descriptors to have the "text" attribute be 'ascending'
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        
        // Return the request
        return request
    }

    // @NSManaged compiler attribute indicates that the storage and implementation of a property is handled by Core Data
    @NSManaged public var isCompleted: Bool
    @NSManaged public var text: String?

}
