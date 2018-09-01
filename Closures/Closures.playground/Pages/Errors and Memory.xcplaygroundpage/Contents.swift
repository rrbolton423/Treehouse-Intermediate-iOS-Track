extension Int {
    func apply(_ value: Int, operation: (Int, Int) throws -> Int) rethrows -> Int {
        return try operation(self, value)
    }
}

enum MathError: Error {
    case divideByZero
}

do {
    try 10.apply(0) {
        if $1 == 0 {
            throw MathError.divideByZero
        } else {
            return $0/$1
        }
    }
} catch MathError.divideByZero {
    print("Error")
}

10.apply(12) { $0 + $1 }

[1,2].map { $0 }

// Memory Considerations

class NetworkSessionManager {
    
    typealias CompletionHandler = () -> Void
    
    var completionHandlers: [CompletionHandler] = []
    
    func dataTask(with handler: @escaping CompletionHandler) {
        completionHandlers.append(handler)
    }
}

// Reference Cycles

class Fibonacci {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    lazy var fibonacci: () -> Int = { [unowned self] in
        // Some temporary variables.
        var a = 0
        var b = 1
        
        // Add up numbers to the desired iteration.
        for _ in 0..<self.value {
            let temp = a
            a = b
            b = temp + b
        }
        
        return a
    }
    
    deinit {
        print("\(value) is being deinitialized. Memory deallocated")
    }
}

let f = Fibonacci(value: 7)
f.fibonacci()

var t: Fibonacci? = Fibonacci(value: 8)
t?.fibonacci()
t = nil

















