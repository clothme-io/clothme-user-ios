//
//  RemoveProductDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct RemoveProductDTO : RequestDataAble, CompanyDataAble {
    let userId: String
    let productId: String
    
    var companyId: String
    var locationId: String
}
