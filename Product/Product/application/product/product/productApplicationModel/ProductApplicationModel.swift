//
//  ProductDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct ProductApplicationModel : Codable {
    let productId: String
    let productName: String
    let productDescription: String
    let productPrice: Double
    let productGender: String
    let productCategory: String
    let productCategoryType: String
    let productDiscount: Double
    let productReturns: String
    let productDelivery: String
    
    
    let companyId: String
    let brandId: String
    let locationId: String
}
