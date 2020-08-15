//
//  WishListItemApplicationModel.swift
//  Product
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct WishLIstItemApplicationModel : RequestDataAble {
    let productId: String
    let productImage: String
    let productName: String
    let productPrice: ProductPriceApplicationModel
    let productDescription: String
    let dateAdded: String
}
