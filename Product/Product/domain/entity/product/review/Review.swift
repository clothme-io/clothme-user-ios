//
//  Review.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Review: Entity {
    
    private let reviewId: ReviewId
    private let productId: ProductId
    private let reviewText: ReviewText
    private let star: Star
    private let reviewDate: ReviewDate
    private let modifiedDate: ModifiedDate
}
