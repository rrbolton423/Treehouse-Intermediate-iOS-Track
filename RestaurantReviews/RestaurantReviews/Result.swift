//
//  Result.swift
//  RestaurantReviews
//
//  Created by Romell Bolton on 11/18/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
