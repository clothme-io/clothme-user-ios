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
    
    private init(
        brandId: BrandId,
        brandName: BrandName,
        brandCategory: BrandCategory,
        brandBadge: BrandBadge,
        returnPolicy: BrandReturnPolicy,
        deliveryPolicy: BrandDeliveryPolicy
    ) {
        self._brandId = brandId
        self._brandName = brandName
        self._brandCategory = brandCategory
        self._brandBadge = brandBadge
        self._returnPolicy = returnPolicy
        self._deliveryPolicy = deliveryPolicy
        super.init(_id: Guid(value: brandId.value().toIdString()))
    }
    
    static func create(
        brandId: BrandId,
        brandName: BrandName,
        brandCategory: BrandCategory,
        brandBadge: BrandBadge,
        returnPolicy: BrandReturnPolicy,
        deliveryPolicy: BrandDeliveryPolicy
    ) -> ResultOption<Brand, AppError> {
        return .ok(Brand(
            brandId: brandId,
            brandName: brandName,
            brandCategory: brandCategory,
            brandBadge: brandBadge,
            returnPolicy: returnPolicy,
            deliveryPolicy: deliveryPolicy)
        )
    }
    
    func getBrandId() -> BrandId {
        return self._brandId
    }
    
    func getBrandName() -> BrandName {
        return self._brandName
    }
    
    func getBrandCategory() -> BrandCategory {
        return self._brandCategory
    }
    
    func getBrandBadge() -> BrandBadge {
        return self._brandBadge
    }
    
    func getReturnPolicy() -> BrandReturnPolicy {
        return self._returnPolicy
    }
    
    func getDeliveryPolicy() -> BrandDeliveryPolicy {
        return self._deliveryPolicy
    }
    
}
