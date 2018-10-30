//
//  ArtworkDownloader.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/29/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation
import UIKit

class ArtworkDownloader: Operation {
    // Provide implementation for the main function
    // Download album artwork and assign it back to the album
    
    let album: Album
    
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    override func main() {
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: album.artworkUrl) else {
            return
        }
        
        // Get the data from the URL
        let imageData = try! Data(contentsOf: url)
        
        // Check if the operation has been cancelled
        if self.isCancelled {
            return
        }
        
        // If the data is valid...
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .downloaded
        } else {
            // Indicate that teh attempt failed
            album.artworkState = .failed
        }
    }
}
