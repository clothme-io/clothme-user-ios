//
//  EmailSignInError.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public enum EmailSignInError : Error {
    case emailOrPasswordIsWrong
    case passwordCannotBeEmpty
    case emailCannotBeEmpty
    case unKnown(Error)
}

