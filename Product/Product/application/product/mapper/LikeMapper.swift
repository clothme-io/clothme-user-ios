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
        let likeId = LikeId.create(id: Guid(value: data.likeId)).OptionalData().value
        let productId = ProductId.create(id: Guid(value: data.productId)).OptionalData().value
        let likeCount = LikeCount.create(with: data.likeCount).OptionalData().value
        
        let likeResult = Like.create(
            likeId: <#T##LikeId#>,
            productId: <#T##ProductId#>,
            likeCount: <#T##LikeCount#>
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
