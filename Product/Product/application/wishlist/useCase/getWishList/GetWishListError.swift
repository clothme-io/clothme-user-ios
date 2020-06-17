//
//  GetWishListError.swift
//  Product
//
//  Created by MACPRO on 2020-05-27.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

enum GetWishListError: String, Error {
    case wishListDoesNotExist
    case invalidData
    case invalidResponse
    case invalidWishListId
    case unableToComplete
}
