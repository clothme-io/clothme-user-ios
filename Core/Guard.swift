//
//  Guard.swift
//  Core
//
//  Created by MACPRO on 2020-03-27.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public struct Guard {
    
    public static func AgainstNilString (argument: String?) -> Bool {
        if argument == nil {
            return false
        }
        return true
    }
    
    public static func againstNil (argument: Any?) -> Bool {
        if argument == nil {
            return false
        }
        return true
    }
    
    public static func AgainstNilStringBulk (arguments: [String]) -> Bool {
        for item in arguments {
            let result = self.AgainstNilString(argument: item)
            if (!result) {
                return false
            }
        }
        return true
    }
    
    public static func AgainstEmptyString (argument: String?) -> Bool {
        let trimmed = argument?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
        guard let trim = trimmed, trim.isEmpty else {
            return false;
        }
        return true;
    }
    
    public static func AgainstZeroInt (value: Int) -> Bool {
        if value <= 0 {
            return false
        }
        return true
    }
    
    public static func againstNegative (value: Double) -> Bool {
       if value < 0 {
           return false
       }
       return true
    }
    
    public static func againstNilObject (argument: AnyObject?) -> Bool {
        if argument == nil {
            return false
        } else {
            return true
        }
    }
    
    
}
