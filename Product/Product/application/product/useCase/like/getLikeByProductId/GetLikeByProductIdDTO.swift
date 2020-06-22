//
//  GetLikeByProductIdDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct GetLikeByProductIdDTO : RequestDataAble {
    let productId: String
    let like: LikeApplicationModel
    let companyId: String
    let locationId: String
}
