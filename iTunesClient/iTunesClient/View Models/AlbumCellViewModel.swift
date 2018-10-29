//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/27/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

struct AlbumCellViewModel {
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumCellViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MMM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
