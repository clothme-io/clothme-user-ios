//
//  Age.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Age : Equatable {
    
    private var _year: Int?;
    private var _month: Int?;
    private var _day: Int?;
    
    private init(year: Int?, month: Int?, day: Int?){
        self._year = year;
        self._month = month;
        self._day = day;
    }
    
    public static func create(with dateOfBirth: String) -> ResultOption<Age, AppError> {
        let today = Date();
        let calender = Calendar.current;
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateOfBirth)!
        let userAge = calender.dateComponents([.year, .month, .day], from: date, to: today);
        
        guard let day = userAge.day, let month = userAge.month, let year = userAge.year else { return .error(AppError.ageTooYoung)}
        
        if (!validateForNilValue(day: day, month: month, year: year)) {
            return .error(AppError.nilValueNotAllowed)
        }
        
        if (!validateForNegativeValue(day: day, month: month, year: year)) {
            return .error(AppError.negativeValueNotAllowed)
        }
        
        return .ok(Age(year: year, month: month, day: day))
    }
    
    var year: Int? {
        return self._year
    }
    
    var month: Int? {
        return self._month
    }
    
    var day: Int? {
        return self._day
    }
    
}


// MARK: Validation
extension Age {
    private static func validateForNegativeValue(day: Int, month: Int, year: Int) -> Bool {
        let validateDay = Guard.againstNegative(value: Double(Int(day)))
        let validateMonth = Guard.againstNegative(value: Double(Int(month)))
        let validateYear = Guard.againstNegative(value: Double(Int(year)))
        if !validateDay || !validateMonth || !validateYear {
            return false
        }
         return true
     }
     
     private static func validateForNilValue(day: Int, month: Int, year: Int) -> Bool {
        let validateDay = Guard.againstNil(argument: day)
        let validateMonth = Guard.againstNil(argument: month)
        let validateYear = Guard.againstNil(argument: year)
        if !validateDay || !validateMonth || !validateYear {
            return false
        }
        return true
     }
}
