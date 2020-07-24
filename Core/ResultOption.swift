//
//  Result.swift
//  Core
//
//  Created by MACPRO on 2020-03-27.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public enum ResultOption<T, E> {
    case ok(T)
    case error(E)
}

extension ResultOption {
    public func OptionalValue(result: ResultOption<T, E>) -> (optionalData: T?, error: E?) {
        switch result {
        case .ok(let x):
            return (x, nil)
        case .error(let err):
            return (nil, err)
        }
    }
}

extension ResultOption {
    public func OptionalData() -> (value: T?, error: E?) {
        switch self {
        case .ok(let x):
            return (x, nil)
        case .error(let err):
            return (nil, err)
        }
    }
}

extension ResultOption {
    public func isSuccess() -> Bool {
        switch self {
        case .ok(_):
            return true
        case .error(_):
            return false
        }
    }
}
