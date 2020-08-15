//
//  LikeDomainMap.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class LikeMapper {
    
    static func toDomainModel(data: LikeApplicationModel) -> ResultOption<Like, AppError> {
        let id = LikeId.create(id: Guid(value: data.likeId)).OptionalData().value
        guard let likeId = id else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let pId = ProductId.create(id: Guid(value: data.productId)).OptionalData().value
        guard let productId = pId else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let lCount = LikeCount.create(with: data.likeCount).OptionalData().value
        guard let likeCount = lCount else {
            return .error(AppError.emptyValueNotAllowed)
        }
        
        let likeResult = Like.create(
            likeId: likeId,
            productId: productId,
            likeCount: likeCount
            ).OptionalData().value
        
        guard let like = likeResult else {
            return .error(AppError.sameValueNotAllowed)
        }
        
        return .ok(like)
    }
    
    static func toDataModel(model: Like) -> LikeApplicationModel {
        return LikeApplicationModel(
            likeId: model.getLikeId().value().toIdString(),
            productId: model.getProductId().value().toIdString(),
            likeCount: model.getLikeCount().count
        )
    }
    
}
