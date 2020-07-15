//
//  SentDate.swift
//  User
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct SentDate {
    private var _value: String
    
    private init(date: String) {
        self._value = date
    }
    
    public static func create(date: String) -> ResultOption<SentDate, AppError> {
        return .ok(SentDate(date: date))
    }
    
    var value : String {
        return self._value
    }
    
    public func change(newDate: String, oldDate: SentDate) -> ResultOption<SentDate, AppError> {
        return .ok(SentDate(date: newDate))
    }
}



// MARK: Validation
extension SentDate {
    
}
