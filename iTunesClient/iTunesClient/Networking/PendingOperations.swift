//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/29/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

class PendingOperations {
    
    // dictionary that keeps track of operations created and the index paths they are associated with
    var downloadsInProgress = [IndexPath: Operation]()
    
    // OperationQueue we are adding our Operations to
    let downloadQueue = OperationQueue()
}
