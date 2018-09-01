func double(_ value: Int) -> Int {
    return value * 2
}

let doubleFunction = double
doubleFunction(2)

let numbers = [1,2,3,4,5]
let doubledNumbers = numbers.map(doubleFunction)

// Closure Expression Syntax

// Rule #1: Define the closure inline

let tripledNumbers = numbers.map({(value: Int) -> Int in
    return value * 3
})

// Rule #2: Inferring Type From Context

numbers.map({ value in return value * 3 })

// Rule #3: Implicit Returns from Single-Expression Closures

numbers.map({ value in value * 3 })

// Rule #4: Shorthand Argument Names

numbers.map({ $0 * 3 })

// Rule #5: Trailing Closures

numbers.map() { $0 * 3 }

//numbers.map() { number -> Int in
//    if number % 2 == 0 {
//        return number/2
//    }
//    
//    return number/3
//}

// Rule #6: Ignoring Parentheses

numbers.map { $0 * 3 }




























