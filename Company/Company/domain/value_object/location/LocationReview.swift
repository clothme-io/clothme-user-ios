//
//  LocationReview.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LocationReview: Equatable {
    
    private var _text: String;
    private var _star: Double
    
    private init(
        text: String,
        star: Double
    ) {
        self._text = text
        self._star = star
    }
    
    public static func create(text: String, star: Double) -> ResultOption<LocationReview, AppError> {
        let validText = Guard.againstNilValue(argument: text)
        let validStar = Guard.againstNegative(value: star)
        if !validText || !validStar {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LocationReview(text: text, star: star))
    }
    
    public var review: String {
        return self._text
    }
    
    public var star: Double {
        return self._star
    }
    
}
