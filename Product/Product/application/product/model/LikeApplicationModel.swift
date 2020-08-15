//
//  LikeDTO.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation


struct LikeApplicationModel : Codable {
    let likeId: String
    let productId: String
    let likeCount: Int
}
