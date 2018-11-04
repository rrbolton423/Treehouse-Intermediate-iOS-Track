//
//  Item.swift
//  Shopping
//
//  Created by Romell Bolton on 10/31/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title = ""
    @objc dynamic var qty = 0
    @objc dynamic var category: Category? // to-one relationship to category
}
