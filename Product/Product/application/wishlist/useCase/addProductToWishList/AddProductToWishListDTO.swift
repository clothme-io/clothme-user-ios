//
//  AddProductToWishListDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AddProductToWishListDTO : RequestDataAble, CompanyDataAble {
    let productId: String
    let productName: String
    let productDescription: String
    let productGender: String
    let productQuantity: Int
    let productDiscount: Double
    let productPrice: Double
    let productTax: Double
    let productReturnPolicy: String
    let productDeliveryPolicy: String
    
    var locationId: String
    var companyId: String
    var brandId: String
}
