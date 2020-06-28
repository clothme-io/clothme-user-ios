//
//  Guid.swift
//  Core
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

open class Guid : Equatable {

    private let Id: String
    
    public init(value: String?) {
        self.Id = value ?? UUID().uuidString
    }
    
    public func toString() -> String {
        return self.Id
    }
    
    public static func == (lhs: Guid, rhs: Guid) -> Bool {
        return lhs.Id as AnyObject === rhs.Id as AnyObject
    }
}
