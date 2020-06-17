//
//  AcceptedDate.swift
//  Invite
//
//  Created by MACPRO on 2020-04-17.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct AcceptedDate {
    private var _value: String
    
    private init(date: String) {
        self._value = date
    }
    
    public static func create(date: String) -> ResultOption<AcceptedDate, ValidationError> {
        return .ok(AcceptedDate(date: date))
    }
    
    var value : String {
        return self._value
    }
    
    public func change(newDate: String, oldDate: AcceptedDate) -> ResultOption<AcceptedDate, ValidationError> {
        return .ok(AcceptedDate(date: newDate))
    }
}
