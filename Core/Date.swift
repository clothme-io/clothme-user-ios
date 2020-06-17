//
//  Date.swift
//  Core
//
//  Created by MACPRO on 2020-04-20.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public struct DateObject {
    
    public static func currentDate() -> String {
        let currentDate = Date()
        return currentDate.description
    }
}
