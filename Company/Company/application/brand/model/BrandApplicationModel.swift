//
//  BrandApplicationModel.swift
//  Company
//
//  Created by MACPRO on 2020-08-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct BrandApplicationModel {
    let brandId: String?
    let brandName: String?
    let brandCategory: String?
    let brandBadge: BrandBadgeApplicationModel?
    let returnPolicy: String?
    let deliveryPolicy: String?
}

struct BrandBadgeApplicationModel {
    let ethicalBadge: Bool?
    let refundBadge: Bool?
    let returnBadge: Bool?
    let environmentConsciousBadge: Bool?
}
