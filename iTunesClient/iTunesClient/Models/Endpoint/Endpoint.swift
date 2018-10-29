//
//  Endpoint.swift
//  iTunesClient
//
//  Created by Romell Bolton on 10/28/18.
//  Copyright © 2018 Romell Bolton. All rights reserved.
//

import Foundation

protocol Endpoint {
    // must provide info about a base url and path
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    // parse urls and construct urls form their various parts
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path // set the path
        components.queryItems = queryItems // set the query items
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url! // create url at compile time
        return URLRequest(url: url)
    }
}

enum Itunes {
    case search(term: String, media: ItunesMedia?)
    case lookup(id: Int, entity: ItunesEntity?)
}

extension Itunes: Endpoint {
    var base: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case .search: return "/search"
        case .lookup: return "/lookup"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term, let media):
            var result = [URLQueryItem]()
            
            let searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)
                result.append(mediaItem)
                
                if let entityQueryItem = media.entityQueryItem {
                    result.append(entityQueryItem)
                }
                
                if let attributeQueryItem = media.attributeQueryItem {
                    result.append(attributeQueryItem)
                }
            }
            
            return result
        case .lookup(id: let id, let entity):
            return [
                URLQueryItem(name: "id", value: id.description),
                URLQueryItem(name: "entity", value: entity?.entityName)
            ]
        }
    }
}
