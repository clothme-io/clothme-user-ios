//
//  Money.swift
//  Core
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public struct Money : Equatable {
    let _curreny: String
    let _value: Double
    
    private init(
        currency: String,
        value: Double
    ) {
        self._curreny = currency
        self._value = value
    }
    
    static func create(
        currency: String,
        value: Double
    ) -> ResultOption<Money, AppError> {
        return .ok(Money(currency: currency, value: value))
    }
    
    func getCurrency() -> String {
        return self._curreny
    }
    
    func getValue() -> Double {
        return self._value
    }
}
