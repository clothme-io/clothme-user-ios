//
//  OperationDuration.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct OperationDuration: Equatable {
    
    private var _year: Int
    private var _month: Int
    private var _day: Int
    
    private init(
        year: Int,
        month: Int,
        day: Int
    ) {
        self._year = year
        self._month = month
        self._day = day
    }
    
    public static func create(
        year: Int,
        month: Int,
        day: Int
    ) -> ResultOption<OperationDuration, AppError> {
        let validYear = Guard.againstZeroInt(value: year)
        let validMonth = Guard.againstZeroInt(value: month)
        let validDay = Guard.againstZeroInt(value: day)
        if !validYear || !validMonth || !validDay {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(OperationDuration(
            year: year,
            month: month,
            day: day)
        )
    }
    
    public var year: Int {
        return self._year
    }
    
    public var month: Int {
        return self._month
    }
    
    public var day: Int {
        return self._day
    }
    
}
