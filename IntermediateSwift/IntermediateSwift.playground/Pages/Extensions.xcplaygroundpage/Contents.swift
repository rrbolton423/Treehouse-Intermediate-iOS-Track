// Extensions

extension Int {
    var isOdd: Bool {
        return self % 2 != 0
    }
}

3.isOdd
2.isOdd

// Protocol Conformance Through Extensions

protocol UniquelyIdentifiable {
    var uuid: Int { get }
}

import UIKit

extension UIView: UniquelyIdentifiable {
    var uuid: Int {
        return hash
    }
}

let view = UIView()
view.hash

view is UniquelyIdentifiable

// Protocol Extensions

protocol RandomNumberGenerator {
    func random() -> Int
}

extension RandomNumberGenerator {
    func random() -> Int {
        return Int(arc4random())
    }
}

class Generator: RandomNumberGenerator {
    func random() -> Int {
        return 2
    }
}

let generator = Generator()
generator.random()

protocol Person {
    var firstName: String { get }
    var lastName: String { get }
    var fullName: String { get }
    
    func greeting() -> String
}

extension Person {
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    func greeting() -> String {
        return "Hi, my name is \(fullName)"
    }
}

struct User: Person {
    let firstName: String
    let lastName: String
    
    func greeting() -> String {
        return "Hey there! Nice to meet you, my name is \(fullName)"
    }
    
    var fullName: String {
        return "\(lastName), \(firstName)"
    }
}

let user = User(firstName: "Pasan", lastName: "Premaratne")
user.fullName
user.greeting()

let anotherUser: Person = User(firstName: "Craig", lastName: "Dennis")
anotherUser.fullName
anotherUser.greeting()

struct Friend: Person {
    let firstName: String
    let middleName: String?
    let lastName: String
    
    var fullName: String {
        guard let middleName = middleName else {
            return "\(firstName) \(lastName)"
        }
        
        return "\(firstName) \(middleName) \(lastName)"
    }
    
    func greeting() -> String {
        return "Hola, \(fullName)!"
    }
}

let someFriend = Friend(firstName: "Benedict", middleName: "J", lastName: "Jakuben")

let people = [user, anotherUser, someFriend]

for person in people {
    print(person.greeting())
}





































