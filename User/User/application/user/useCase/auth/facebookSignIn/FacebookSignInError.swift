//
//  FacebookSignInError.swift
//  User
//
//  Created by MACPRO on 2020-05-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation


public enum FacebookSignInError: Error {
    case somethingWentWrong
    case youNeedToBeOlder
    case unKnown(Error)
}
