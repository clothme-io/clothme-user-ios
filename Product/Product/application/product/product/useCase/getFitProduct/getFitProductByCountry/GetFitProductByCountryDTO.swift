//
//  GetFitProductByCountryDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct GetFitProductByCountryDTO : RequestDataAble {
    let country: String
    let locationId: String
    let companyId: String
    
    let userId: String
}
