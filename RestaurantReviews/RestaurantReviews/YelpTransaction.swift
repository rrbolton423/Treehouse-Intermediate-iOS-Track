//
//  YelpTransaction.swift
//  RestaurantReviews
//
//  Created by Romell Bolton on 11/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum YelpTransaction {
    case pickup, delivery, restaurantReservation
}

extension YelpTransaction {
    init?(rawValue: String) {
        switch rawValue {
        case "pickup": self = .pickup
        case "delivery": self = .delivery
        case "restaurant_reservation": self = .restaurantReservation
        default: return nil
        }
    }
}
