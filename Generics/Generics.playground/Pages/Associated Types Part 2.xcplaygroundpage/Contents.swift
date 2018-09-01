protocol DataProvider {
    associatedtype Object
    
    func object(atIndex index: Int) -> Object
}

protocol ConfigurableView {
    associatedtype Data
    
    func configure(with data: Data)
}

class ViewController<View: ConfigurableView, DataSource: DataProvider> where View.Data == DataSource.Object {
    let view: View
    let data: DataSource
    
    init(view: View, data: DataSource) {
        self.view = view
        self.data = data
    }
    
    func start() {
        let object = data.object(atIndex: 0)
        view.configure(with: object)
    }
}

struct StringDataProvider: DataProvider {
    
    let data = ["someValue", "anotherValue"]
    
    func object(atIndex index: Int) -> String {
        return data[index]
    }
}

struct IntView: ConfigurableView {
    
    func configure(with data: Int) {
        //
    }
}

struct StringView: ConfigurableView {
    func configure(with data: String) {
        //
    }
}

let controller = ViewController(view: StringView(), data: StringDataProvider())

import Foundation

struct Weather {
    let temperature: Double
    let humidity: Double
    let chanceOfRain: Double
    let icon: String
    let highTemperature: Double
    let lowTemperature: Double
    let sunrise: Date
    let sunset: Date
}

let current = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

protocol PrettyPrintable {
    var prettyDescription: String { get }
}

extension Weather: PrettyPrintable {
    var prettyDescription: String {
        return "Temperature: \(temperature)\nHumidity: \(humidity)\nChance of Rain: \(chanceOfRain)\nIcon: \(icon)\nHigh Temperature: \(highTemperature)\nLow Temperature: \(lowTemperature)\nSunrise time: \(sunrise)\nSunset time: \(sunset)"
    }
}

let tuesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let wednesday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let thursday = Weather(temperature: 63, humidity: 0.36, chanceOfRain: 0.04, icon: "Cloudy", highTemperature: 67, lowTemperature: 50, sunrise: Date(), sunset: Date())

let week = [current, tuesday, wednesday, thursday]

//extension Array where Element: PrettyPrintable {
//    var prettyDescription: String {
//        var output = ""
//        
//        for (index, element) in self.enumerated() {
//            output += "\n\n********\n\nIndex:\(index)\n\n\(element.prettyDescription)"
//        }
//        
//        return output
//    }
//}

let array = [1,2]

extension Sequence where Iterator.Element == Weather {
    var prettyDescription: String {
        var output = ""
        
        for (index, element) in self.enumerated() {
            output += "\n\n********\n\nIndex:\(index)\n\n\(element.prettyDescription)"
        }
        
        return output
    }
}

dump(current)






















