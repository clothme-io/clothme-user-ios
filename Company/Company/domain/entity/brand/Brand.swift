//
//  Brand.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Brand: AggregateRoot {
    private let _brandId: BrandId
    private let _brandName: BrandName
    private let _brandCategory: BrandCategory
    private let _brandBadge: BrandBadge
    private let _returnPolicy: BrandReturnPolicy
    private let _deliveryPolicy: BrandDeliveryPolicy
}
