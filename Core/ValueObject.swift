//
//  ValueObject.swift
//  Core
//
//  Created by MACPRO on 2020-04-18.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public struct ValueObject<T: Equatable> : Equatable {
    
    private var value: T
    
    public static func == (lhs: ValueObject<T>, rhs: ValueObject<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
