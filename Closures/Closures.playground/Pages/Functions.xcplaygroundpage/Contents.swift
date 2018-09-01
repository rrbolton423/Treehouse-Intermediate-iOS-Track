func printString(_ string: String) {
    print("Printing the string passed in as an argument: \(string)")
}

printString("Hi, my name is Pasan")

let stringPrinterFunction = printString
stringPrinterFunction("Hi, look at me!")

func sum(a: Int, b: Int) -> Int {
    return a + b
}

let addTwoNumbers = sum
addTwoNumbers(1,2)

// Functions as Parameters

func displayString(usingFunction function: (String) -> Void) {
    function("I'm a function inside a function")
}

displayString(usingFunction: printString)

extension Int {
    func applyOperation(_ operation: (Int) -> Int) -> Int {
        return operation(self)
    }
}

func double(_ value: Int) -> Int {
    return value * 2
}

10.applyOperation(double)

func closestMultipleOfSix(_ value: Int) -> Int {
    for x in 1...100 {
        let multiple = x * 6
        
        if multiple - value < 6 && multiple > value {
            return multiple
        } else if multiple == value {
            return value
        }
    }
    
    return 0
}

32.applyOperation(closestMultipleOfSix)
12.applyOperation(closestMultipleOfSix)
200.applyOperation(closestMultipleOfSix)

typealias IntegerFunction = (Int) -> Void

func gameCounter() -> IntegerFunction {
    
    var localCounter = 0
    
    func increment(_ i: Int) {
        localCounter += i
        print("Local counter value: \(localCounter)")
    }
    
    return increment
}

let counter = gameCounter()
counter(1)
counter(1)
counter(45)

let anotherCounter = gameCounter()
print("*****")
anotherCounter(1)
anotherCounter(10)
anotherCounter(60)







































