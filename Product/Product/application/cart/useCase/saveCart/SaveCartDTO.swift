//
//  SaveCartDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SaveCartDTO : RequestDataAble, CompanyDataAble {
    let cartId: String
    let product: ProductApplicationModel
    
    var companyId: String
    var locationId: String
    var brandId: String
}
