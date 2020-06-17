//
//  EmailSignUpError.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


public enum EmailSignUpError : Error {
    case emailMustBeProvided
    case passwordMustBeProvided
    case passwordMustBeMoreThanEightCharacters
    case passwordMustContainCapitalLetterAndOneNumber
    case firstNameCannotBeEmpty
    case unKnown(Error)
}
