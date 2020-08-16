//
//  CartItemApplicationModel.swift
//  Product
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct CartItemApplicationModel : RequestDataAble {
    let productId: String
    let productImage: [String]
    let productName: String
    let productPrice: ProductPriceApplicationModel
    let productDescription: String
    let productTax: Double
    let productDiscount: Double
    let itemCount: Int
    let dateAdded: String
    let modifiedDate: String
}
