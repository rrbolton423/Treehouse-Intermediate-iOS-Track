// Memory Management

class Food {
    let name: String
    
    init(name: String) {
        self.name = name
        print("Memory allocated for \(name)")
    }
    
    deinit {
        print("\(name) is being deinitialized. Memory deallocated")
    }
}

var reference1: Food? = Food(name: "Hot Dogs")
var reference2: Food? = reference1

reference1 = nil
reference2 = nil

protocol Residence {
    weak var tenant: Person? { get set }
}

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized. Memory deallocated")
    }
}

class Apartment: Residence {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized. Memory deallocated")
    }
}

var person: Person? = Person(name: "Pasan")
var apartment: Apartment? = Apartment(unit: "3B")

person?.apartment = apartment
apartment?.tenant = person

person = nil
apartment = nil

protocol Loan: class {
    var payee: Customer { get set }
}

class Customer {
    weak var loan: Loan?
}


















































