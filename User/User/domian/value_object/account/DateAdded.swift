//
//  DateAdded.swift
//  User
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct DateAdded {
    private var _date: String
    
    private init(date: String) {
        self._date = date
    }
    
    static func create() -> ResultOption<DateAdded, AppError> {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let dateString = dateFormatter.string(from: date)
        return .ok(DateAdded(date: dateString))
    }
    
    static func createFromData(with dateOfCreation: String) -> ResultOption<DateAdded, AppError> {
        return .ok(DateAdded(date: dateOfCreation))
    }
    
    var value: String {
        return self._date
    }
}
