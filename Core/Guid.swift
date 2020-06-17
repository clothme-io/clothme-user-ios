//
//  Guid.swift
//  Core
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

open class Guid {
    private let id: String
    
    public init(value: String?) {
        self.id = value ?? UUID().uuidString
    }
    
    public func toString() -> String {
        return self.id
    }
}
