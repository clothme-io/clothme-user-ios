//
//  Like.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Like: Entity {
    private let _likeId: LikeId
    private let _productId: ProductId
    private let _likeCount: LikeCount
    
    private init(
        likeId: LikeId,
        productId: ProductId,
        likeCount: LikeCount
    ) {
        self._likeId = likeId
        self._productId = productId
        self._likeCount = likeCount
        super.init(_id: Guid(value: likeId.value().toIdString()))
    }
    
    public static func create(
        likeId: LikeId,
        productId: ProductId,
        likeCount: LikeCount
    ) -> ResultOption<Like, AppError> {
        return .ok(Like(likeId: likeId, productId: productId, likeCount: likeCount))
    }
    
    func getLikeId() -> LikeId {
        return self._likeId
    }
    
    func getProductId() -> ProductId {
        return self._productId
    }
    
    func getLikeCount() -> LikeCount {
        return self._likeCount
    }
    
}
