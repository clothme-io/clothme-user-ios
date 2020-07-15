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
    
    private var _value: Int
    
    private init (connectionDate: Int) {
        self._value = connectionDate
    }
    
    static func create(connectionDate: String) -> ResultOption<ConnectionDuration, AppError> {
        return validateForNilValue(input: connectionDate)
        .bind(validateForEmptyValue(input:))
        .bind(initConnectionDuration(_:))
    }
    
    var value: Int {
        return self._value
    }
    


}

extension ConnectionDuration {
   private static func validateForNilValue (input: String) -> ResultOption<String, AppError> {
        let validInput = Guard.againstNil(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(AppError.negativeValueNotAllowed)
    }
    
    private static func validateForEmptyValue (input: String) -> ResultOption<String, AppError> {
        let validInput = Guard.AgainstEmptyString(argument: input)
        if validInput {
            return .ok(input)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func initConnectionDuration(_ input: String) -> ResultOption<ConnectionDuration, AppError> {
        let connectionDateString: String = input
        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let startDate = dateFormatter.date(from: connectionDateString)!
        let currentDate = dateFormatter.string(from: Date())
        let endDate = dateFormatter.date(from: currentDate)
        let calendar = Calendar.current
        let dateDifference = calendar.dateComponents([.day], from: startDate, to: endDate!)
        return .ok(ConnectionDuration(connectionDate: dateDifference.day!))
    }
}
