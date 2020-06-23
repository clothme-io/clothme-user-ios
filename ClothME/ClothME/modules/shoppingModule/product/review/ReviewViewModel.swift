//
//  ReviewViewModel.swift
//  ClothME
//
//  Created by MACPRO on 2020-06-19.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI
import Combine
import Product

final class ReviewViewModel {
    
    private let reviewRepositoryImpl: ReviewRepositoryImpl = ReviewRepositoryImpl()
    
    private var bag = Set<AnyCancellable>()
    
    func getReviewByProductId() {}
    
    func addReview() {}
    
    func removeReview() {}
    
    func editReview() {}
    
}
