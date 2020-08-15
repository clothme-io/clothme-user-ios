//
//  ProductDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ProductApplicationModel : RequestDataAble {
    let productId: String
    let productName: String
    let productDescription: String
    let productPrice: ProductPriceApplicationModel
    let productGender: String
    let productCategory: String
    let productCategoryType: String
    let productDiscount: Double
    let productReturns: String
    let productDelivery: String
    let like: LikeApplicationModel
    let review: [ReviewApplicationModel?]
    
}

struct ProductPriceApplicationModel : RequestDataAble {
    let currency: String
    let amount: Double
}


