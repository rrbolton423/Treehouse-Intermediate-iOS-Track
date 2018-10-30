//
//  PendingOperations.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/29/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue() 
}
