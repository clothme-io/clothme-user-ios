//
//  GetProductByBrandDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct GetProductByProductBrandDTO : RequestDataAble, CompanyDataAble {
    let userId: String
    let brandId: String
    
    var companyId: String
    var locationId: String
}
