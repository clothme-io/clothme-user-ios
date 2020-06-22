//
//  GetFitProductByCityDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct GetFitProductByCityDTO : RequestDataAble, CompanyDataAble {
    
    let city: String
    var locationId: String
    var companyId: String
    
    let userId: String
}
