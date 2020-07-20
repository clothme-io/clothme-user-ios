//
//  DateOfBirth.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct DateOfBirth : Equatable {
    
    fileprivate var date: String
    
    private init(date: String) {
        self.date = date
    }
    
    public static func create (date: String) -> ResultOption<DateOfBirth, AppError> {
        let validDate = Guard.againstNilValue(argument: date)
        if !validDate {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(DateOfBirth(date: date))
    }
    
    var value: String {
        return self.date
    }
    
}


