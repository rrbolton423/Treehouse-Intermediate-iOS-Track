// Stored Properties

struct Account {
    let username: String
    let password: String
}

let someAccount = Account(username: "pasanpr", password: "neverUseSimplePasswords")
someAccount.username

// Type Properties

struct Point {
    var x: Int = 0
    var y: Int = 0
}

struct Map {
    static let origin = Point()
    
    static var x: Int {
        return origin.x
    }
}

Map.origin

// Computed Properties

struct Size {
    var width: Int = 0
    var height: Int = 0
}

struct Rectangle {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            
            return Point(x: centerX, y: centerY)
        }
        
        set (centerValue) {
            origin.x = centerValue.x - size.width/2
            origin.y = centerValue.y - size.height/2
        }
    }
}

var rect = Rectangle()
print(rect.center)
rect.size = Size(width: 20, height: 15)
print(rect.center)
rect.center = Point(x: 10, y: 15)
print(rect.center)
print(rect.origin)

// Reading Modes

import UIKit

enum ReadingMode {
    case day
    case evening
    case night
    
    var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .day, .evening: return .default
        case .night: return .lightContent
        }
    }
    
    var headlineColor: UIColor {
        switch self {
        case .night: return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .day, .evening: return UIColor(red: 16/255.0, green: 16/255.0, blue: 16/255.0, alpha: 1.0)
        }
    }
    
    var dateColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var bodyTextColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .night: return UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1.0)
        }
    }
    
    var linkColor: UIColor {
        switch self {
        case .day, .evening: return UIColor(red: 132/255.0, green: 132/255.0, blue: 132/255.0, alpha: 1.0)
        case .night: return UIColor(red: 161/255.0, green: 161/255.0, blue: 161/255.0, alpha: 1.0)
        }
    }
}

let titleLabel = UILabel()

func setupDisplay(with mode: ReadingMode) {
    titleLabel.textColor = mode.headlineColor
}

setupDisplay(with: .night)
setupDisplay(with: .day)

// Lazy Stored Properties

import Foundation

class ReadItLaterNetworkingClient {
    
    lazy var session: URLSession = URLSession(configuration: .default)
    
    // Do other things
}

































