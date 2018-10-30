//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/27/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {
    
    private var albums: [Album]
    
    let pendingOperations = PendingOperations()
    let tableView: UITableView
    
    init(albums: [Album], tableView: UITableView) {
        self.albums = albums
        self.tableView = tableView
        super.init()
    }
    
    // MARK: - Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let albumCell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        
        albumCell.configure(with: viewModel)
        albumCell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        
        return albumCell
    }
    
    // MARK: - Helper
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
    
    // Create operation, add to operation queue, and execute the logic
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        
        // Check to see if we created and added an operation for a given row, if so return from the method
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        // Download the image
        let downloader = ArtworkDownloader(album: album)
        
        // After the download is complete, check to see if it was cancelled
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            // On the main thread
            DispatchQueue.main.async {
               
                // Remove the operation from the dictionary and reload the row whose operation completed
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        // Keep track of it in our dictionary
        pendingOperations.downloadsInProgress[indexPath] = downloader
        
        // Add the Operation to the Queue
        pendingOperations.downloadQueue.addOperation(downloader)
    }

}
