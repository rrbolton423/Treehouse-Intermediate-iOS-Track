//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/29/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        
        //Track time in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        let secondsString = seconds < 10 ? "0\(seconds)": "\(seconds)"
        self.runtime = "\(minutes): " + secondsString
    }
}
