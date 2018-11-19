//
//  YelpUser.swift
//  RestaurantReviews
//
//  Created by Romell Bolton on 11/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class YelpUser: JSONDecodable {
    
    enum ImageDownloadState {
        case placeholder, downloaded, failed
    }
    
    let name: String
    let imageUrl: String
    var image: UIImage? = nil
    var imageState: ImageDownloadState = .placeholder
    
    required init?(json: [String : Any]) {
        guard let imageUrl = json["image_url"] as? String, let name = json["name"] as? String else { return nil }
        self.imageUrl = imageUrl
        self.name = name
        self.image = nil
    }
}
