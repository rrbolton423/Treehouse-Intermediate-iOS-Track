// Associated Types

protocol Stack {
    associatedtype Element
    
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    
    var top: Element? { get }
}

struct IntStack: Stack {
    private var array = Array<Int>()
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int? {
        return array.popLast()
    }
    
    var top: Int? {
        return array.last
    }
}

protocol ShoppingItem {
    var price: Double { get }
}

typealias HashableShoppingItem = Hashable & ShoppingItem

struct Checkout<Item: HashableShoppingItem> {
    var cart = [Item: Int]()
}

class Shape {}

struct Animator<T> where T: Hashable, T: Shape {
    
}

// Associated Types

protocol AnimalFood {}

protocol Animal {
    associatedtype Food: AnimalFood
    func eat(_ food: Food)
}

struct Kibble: AnimalFood {}

class Cat: Animal {
    func eat(_ food: Kibble) {
        // code
    }
}

struct DogFood: AnimalFood {}

class Dog: Animal {
    func eat(_ food: DogFood) {
        //
    }
}

let cat = Cat()
let dog = Dog()

func feed<T: Animal>(_ animal: T) {}

class Wolf<FoodType: AnimalFood>: Animal {
    func eat(_ food: FoodType) {
        //
    }
}

let wolf = Wolf<Kibble>()
let anotherWolf = Wolf<DogFood>()



















































