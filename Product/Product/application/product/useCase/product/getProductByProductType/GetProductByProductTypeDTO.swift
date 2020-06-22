//
//  GetProductByProductTypeDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct GetProductByProductTypeDTO : RequestDataAble, CompanyDataAble {
    var companyId: String
    var locationId: String
    
    let userId: String
    let productType: String
    
}
