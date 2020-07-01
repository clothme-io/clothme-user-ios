//
//  ConnectionDuration.swift
//  User
//
//  Created by MACPRO on 2020-05-10.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ConnectionDuration : Equatable {
    
    private var _value: Date
    
    private init (connectionDate: Date) {
        self._value = connectionDate
    }
    
    static func create(connectionDate: String) -> ResultOption<ConnectionDuration, ValidationError> {
        return validateForNilValue(input: connectionDate)
        .bind(validateForEmptyValue(input:))
        .bind(initConnectionDuration(_:))
    }
    
    var value: Date {
        return self._value
    }
}

extension ConnectionDuration {
   private static func validateForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validInput = Guard.againstNil(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(ValidationError.negativeValueNotAllowed)
    }
    
    private static func validateForEmptyValue (input: String) -> ResultOption<String, ValidationError> {
        let validInput = Guard.AgainstEmptyString(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func initConnectionDuration(_ input: String) -> ResultOption<ConnectionDuration, ValidationError> {
        let connectionDateString: String = input
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'"
        let date = dateFormatter.date(from: connectionDateString)!
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let finalDate = calendar.date(from:components)
        return .ok(ConnectionDuration(connectionDate: finalDate ?? Date()))
    }
}
