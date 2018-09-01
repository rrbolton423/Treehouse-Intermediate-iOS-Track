// Standard Library Functions

let values = [1,2,3,4,5]

var newArray = Array<Int>()

for number in values {
    newArray.append(number * 2)
}

let doubledNumbers = values.map { $0 * 2 }

// Map

extension Array {
    func customMap<T>(_ transform: (Element) -> T) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(transform(x))
        }
        
        return result
    }
}

let integerValues = ["1", "2", "3", "4", "5"].customMap { Int($0) }

import Foundation

struct Formatter {
    static let formatter = DateFormatter()
    
    static func date(from string: String) -> Date? {
        formatter.dateFormat = "d MMM yyy"
        return formatter.date(from: string)
    }
}

let dateStrings = ["20 Oct 1978", "11 Jan 1947", "28 Mar 2002"]

let dates = dateStrings.customMap { Formatter.date(from: $0) }
print(dates)

// Flat Map

struct Post {
    var content: String
    var tags: [String]
}

let blog = [
    Post(content: "Hello, world", tags: ["first", "programming"]),
    Post(content: "Just another short post", tags: ["general"])
]

let tags = blog.flatMap { $0.tags }

extension Array {
    func customFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result = [T]()
        
        for x in self {
            result.append(contentsOf: transform(x))
        }
        
        return result
    }
}

struct Account {
    let username: String
    let billingAddress: String?
}

let allUsers = [
    Account(username: "pasanpr", billingAddress: nil),
    Account(username: "benjakuben", billingAddress: "1234 Imaginary Street"),
    Account(username: "instantNadel", billingAddress: "5678 Doesn't Live Here Dr."),
    Account(username: "sketchings", billingAddress: nil),
    Account(username: "paradoxed", billingAddress: "1122 Nope Lane")
]

let validAddresses = allUsers.flatMap { $0.billingAddress }
validAddresses.count

// Filter

let evenNumbers = (0...100).filter { $0 % 2 == 0 }
print(evenNumbers)

extension Array {
    func customFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var result = [Element]()
        
        for x in self where isIncluded(x) {
            result.append(x)
        }
        
        return result
    }
}

let somePUsers = allUsers.customFilter { $0.username.characters.first == "p" }
print(somePUsers)

// Reduce

let scores = [10, 12, 11, 10, 12, 9]

let totalScore = scores.reduce(0, { total, score in total + score })

extension Array {
    func customReduce<Result>(_ initial: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initial
        
        for x in self {
            result = nextPartialResult(result, x)
        }
        
        return result
    }
}


let dataSet = (1...100).filter { $0 % 3 == 0 && $0 % 7 == 0 }
let identifier = dataSet.reduce("", {string, number in string + "\(number)" })



































