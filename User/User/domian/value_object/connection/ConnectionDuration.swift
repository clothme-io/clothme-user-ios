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
    
    static func create(with connectionDate: String) -> ResultOption<ConnectionDuration, AppError> {
        let validInput = Guard.againstNil(argument: connectionDate)
        if !validInput {
            return .error(AppError.negativeValueNotAllowed)
        }
        let connectionDateString: String = connectionDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let startDate = dateFormatter.date(from: connectionDateString)!
        let currentDate = dateFormatter.string(from: Date())
        let endDate = dateFormatter.date(from: currentDate)
        let calendar = Calendar.current
        let dateDifference = calendar.dateComponents([.day], from: startDate, to: endDate!)
        return .ok(ConnectionDuration(connectionDate: dateDifference.day!))
    }
    
    var value: Int {
        return self._value
    }

}
