//
//  GetProductByLocationDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct GetFitProductByLocationDTO : RequestDataAble, CompanyDataAble {
    var locationId: String
    var companyId: String
    
    let userId: String
}
