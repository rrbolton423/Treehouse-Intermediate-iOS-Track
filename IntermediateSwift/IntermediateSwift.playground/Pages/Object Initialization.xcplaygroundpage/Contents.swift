// Object Initialization

enum Day: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

let day = Day(rawValue: 4)

// Failable & Throwing Inits

enum PersonError: Error {
    case invalidData
}

class Person {
    let name: String
    let age: Int
    
    init(dict: [String: AnyObject]) throws {
        guard let name = dict["name"] as? String, let age = dict["age"] as? Int else {
            throw PersonError.invalidData
        }
        
        self.name = name
        self.age = age
    }
}

// Initializer Delegation - Value Types

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(x: Int, y: Int, height: Int, width: Int) {
        let origin = Point(x: x, y: y)
        let size = Size(width: width, height: height)
        
        self.init(origin: origin, size: size)
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        let origin = Point(x: originX, y: originY)
        
        self.init(origin: origin, size: size)
    }
    
}

// Initializer Delegation - Reference Types

class Vehicle {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unnamed")
    }
}

// Initializer Delegation - Superclasses

class Car: Vehicle {
    let numberOfDoors: Int
    
    init(name: String, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(name: name, numberOfDoors: 4)
    }
    
    convenience init() {
        self.init(name: "Unnamed")
    }
}

// Required Initializers

import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}








































