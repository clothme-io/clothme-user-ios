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
    
    public static func create (dateOfBirth: String) -> ResultOption<Age, ValidationError> {
        let today = Date();
        let calender = Calendar.current;
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateOfBirth)!
        let userAge = calender.dateComponents([.year, .month, .day], from: date, to: today);
        
        guard let day = userAge.day, let month = userAge.month, let year = userAge.year else { return .error(ValidationError.ageTooYoung)}
        
        return validateForNilValue(day: day, month: month, year: year)
        .bind(validateForEmptyValue)
        .bind(initAge)
    }
    
    var year: Int? {
        get {
            return self._year;
        }
    }
    
    var month: Int? {
        get {
            return self._month;
        }
    }
    
    var day: Int? {
        get {
            return self._day
        }
    }
    
}


// MARK: Validation
extension Age {
    private static func validateForEmptyValue (day: Int, month: Int, year: Int) -> ResultOption<(Int, Int, Int), ValidationError> {
        let validateDay = Guard.againstNegative(value: Double(Int(day)))
        let validateMonth = Guard.againstNegative(value: Double(Int(month)))
        let validateYear = Guard.againstNegative(value: Double(Int(year)))
         if validateDay && validateMonth && validateYear {
             return .ok((day, month, year))
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
     private static func validateForNilValue (day: Int, month: Int, year: Int) -> ResultOption<(Int, Int, Int), ValidationError> {
        let validateDay = Guard.againstNil(argument: day)
        let validateMonth = Guard.againstNil(argument: month)
        let validateYear = Guard.againstNil(argument: year)
         if validateDay && validateMonth && validateYear {
              return .ok((day, month, year))
         }
         return .error(ValidationError.emptyValueNotAllowed)
     }
     
    private static func initAge(_ day: Int, _ month: Int, _ year: Int) -> ResultOption<Age, ValidationError> {
         if day < 0 && month < 0 && year < 0 {
             return .error(ValidationError.emptyValueNotAllowed)
         }
        return .ok(Age(year: day, month: month, day: year))
     }
}
