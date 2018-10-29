//
//  Song.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/26/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

struct Song {
    let id: Int
    let name: String
    let censoredName: String
    let trackTime: Int
    let isExplicit: Bool
}

extension Song {
    init?(json: [String: Any]) {
        
        struct Key {
            static let id = "trackId"
            static let name = "trackName"
            static let censoredName = "trackCensoredName"
            static let trackTime = "trackTimeMillis"
            static let isExplicit = "trackExplicitness"
        }
        
        guard let idValue = Int(json[Key.id] as? String ?? "0"),
            let nameValue = json[Key.name] as? String,
            let censoredNameValue = json[Key.censoredName] as? String,
            let trackTimeValue = json[Key.trackTime] as? Int,
            let isExplicitString = json[Key.isExplicit] as? String else {
                return nil
        }
        
        self.id = idValue
        self.name = nameValue
        self.censoredName = censoredNameValue
        self.trackTime = trackTimeValue
        self.isExplicit = isExplicitString == "notExplicit" ? false : true
    }
}
