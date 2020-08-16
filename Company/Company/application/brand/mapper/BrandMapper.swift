//
//  BrandRepository.swift
//  Company
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class BrandMapper {
    
    static func toDomainModel(data: BrandApplicationModel) -> Brand {
        let brandId = BrandId.create(id: Guid(value: data.brandId ?? nil)).OptionalData().value!
        let brandName = BrandName.create(with: data.brandName ?? "").OptionalData().value!
        let brandCategory = BrandCategory.create(with: data.brandCategory ?? "").OptionalData().value!
        let brandBadge = BrandBadge.create(
            ethicalBadge: data.brandBadge?.ethicalBadge ?? false,
            refundBadge: data.brandBadge?.refundBadge ?? false,
            returnBadge: data.brandBadge?.returnBadge ?? false,
            environmentConsciousBadge: data.brandBadge?.environmentConsciousBadge ?? false).OptionalData().value!
        let returnPolicy = BrandReturnPolicy.create(with: data.returnPolicy ?? "").OptionalData().value!
        let deliveryPolicy = BrandDeliveryPolicy.create(with: data.deliveryPolicy ?? "").OptionalData().value!
        
        return Brand.create(
            brandId: brandId,
            brandName: brandName,
            brandCategory: brandCategory,
            brandBadge: brandBadge,
            returnPolicy: returnPolicy,
            deliveryPolicy: deliveryPolicy
        ).OptionalData().value!
    }
    
    static func toDataModel(model: Brand) -> BrandApplicationModel {
        return BrandApplicationModel(
            brandId: model.getBrandId().value().toIdString(),
            brandName: model.getBrandName().name,
            brandCategory: model.getBrandCategory().category,
            brandBadge: BrandBadgeApplicationModel(
                ethicalBadge: model.getBrandBadge().ethicalBadge,
                refundBadge: model.getBrandBadge().refundBadge,
                returnBadge: model.getBrandBadge().returnBadge,
                environmentConsciousBadge: model.getBrandBadge().environmentConsciousBadge
            ),
            returnPolicy: model.getReturnPolicy().policy,
            deliveryPolicy: model.getDeliveryPolicy().policy)
    }
}
