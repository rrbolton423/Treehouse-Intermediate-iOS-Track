//
//  Category.swift
//  Shopping
//
//  Created by Romell Bolton on 10/31/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var title = ""
    let items = List<Item>() // to-many relationship to items
    
    // Method takes in the Realm DB
    static func loadCategories(in realm: Realm) throws {
        
        // Create array of Categories
        let categories = [  Category(value: ["title": "Bakery"]),
                            Category(value: ["title": "Canned Goods"]),
                            Category(value: ["title": "Dairy"]),
                            Category(value: ["title": "Drinks"]),
                            Category(value: ["title": "Produce"]),
                            Category(value: ["title": "Miscellaneous"])
        ]
        
        // Begin Write Transaction
        realm.beginWrite()
        
        // Loop through Categories Array
        for category in categories {
            realm.add(category)
        }
        
        // Commit Write Transaction
        try realm.commitWrite()
    }
}
