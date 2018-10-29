//
//  QueryItemProvider.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/28/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
