//
//  CategoryTableViewController.swift
//  Shopping
//
//  Created by Romell Bolton on 10/31/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    let realm = try! Realm()
    var categories: Results<Category> {
        get {
            return realm.objects(Category.self)
        }
    }
    var selectedCategory: Category?
    weak var delegate:DetailViewControllerProtocol?
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].title
        
        if let category = selectedCategory, category.title == categories[indexPath.row].title {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = categories[indexPath.row]
        delegate?.selected(category: selectedCategory)
    }
}
