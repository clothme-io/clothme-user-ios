//
//  Reviewer.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct Reviewer: Equatable {
    private let _reviewerId: String
    private let _reviewerName: String
    private let _reviewerProfilePhoto: String
    private let _reviewerCity: String
    
    private init(
        reviewerId: String,
        reviewerName: String,
        reviewerProfilePhoto: String,
        reviewerCity: String
    ) {
        self._reviewerId = reviewerId
        self._reviewerName = reviewerName
        self._reviewerProfilePhoto = reviewerProfilePhoto
        self._reviewerCity = reviewerCity
    }
    
    public static func create(
        reviewerId: String,
        reviewerName: String,
        reviewerProfilePhoto: String,
        reviewerCity: String
    ) -> ResultOption<Reviewer, AppError> {
        let validInputId = Guard.againstNilValue(argument: reviewerId)
        let validInputName = Guard.againstNilValue(argument: reviewerName)
        if !validInputId || !validInputName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Reviewer(
            reviewerId: reviewerId,
            reviewerName: reviewerName,
            reviewerProfilePhoto: reviewerProfilePhoto,
            reviewerCity: reviewerCity
        ))
    }
    
    var reviewerId: String {
        return self._reviewerId
    }
    
    var reviewerName: String {
        return self._reviewerName
    }
    
    var reviewerProfilePhoto: String {
        return self._reviewerProfilePhoto
    }
    
    var reviewerCity: String {
        return self._reviewerCity
    }
    
}
