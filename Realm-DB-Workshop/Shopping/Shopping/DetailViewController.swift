//
//  DetailViewController.swift
//  Shopping
//
//  Created by Romell Bolton on 10/31/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit
import RealmSwift

protocol DetailViewControllerProtocol: class {
    func selected(category: Category)
}


class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var qtyTextField: UITextField!
    @IBOutlet weak var categoryButton: UIButton!
    var detailItem: Item?
    // Create a Realm DB instance
    let realm = try! Realm()
    var selectedCategory: Category?
    
    override func viewDidLoad() {
        configureView()
    }
    
    func configureView() {
        // Unwrap that optional and set our TextField
        if let item = detailItem {
            titleTextField.text = item.title
            qtyTextField.text = "\(item.qty)"
            
            categoryButton.setTitle(item.category?.title, for: .normal)
        }
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCategories" {
            let controller = segue.destination as! CategoryTableViewController
            controller.selectedCategory = detailItem?.category
            controller.delegate = self
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func doneTapped(_ sender: AnyObject) {
        
        // Get the title and quantity from the TextField
        guard let title = titleTextField.text, let qty = Int(qtyTextField.text!) else { dismiss(animated: true); return }
        
        if detailItem != nil {  // If there is already a detailItem...
            updateItem(with: title, qty: qty) // Update it
        } else { // If the detailItem is nil, insert a new one
            insertItem(with: title, qty: qty)
        }
        
        // Go back to the MainVC
        dismiss(animated: true)
    }
    
    func updateItem(with title: String, qty: Int) {
        if let item = detailItem {
        do {
            try realm.write {
                item.title = title
                item.qty = qty
                item.category = selectedCategory
            }
        } catch {
            print(error)
            }
        }
    }
    
    func insertItem(with title: String, qty: Int) {
        
        // Create a Realm object and assign it's properties
        let item = Item()
        item.title = title
        item.qty = qty
        item.category = selectedCategory
        
        // Add Item object to the Realm DB
        do {
            try realm.write {
                realm.add(item)
            }
        }catch {
            print(error)
        }
    }
    
    func dismiss(animated: Bool) {
        _ = navigationController?.popViewController(animated: true)
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    func selected(category: Category) {
        selectedCategory = category
        categoryButton.setTitle(category.title, for: .normal)
        dismiss(animated: true)
    }
}
