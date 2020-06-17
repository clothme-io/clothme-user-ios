//
//  ResetPasswordError.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation


enum ResetPasswordError {
    case passwordCannotBeSameWithCurrentPassword
    case passwordMustContainCapitalLetterAndOneNumber
    case passwordMustBeGreaterThanEightCharacters
}
