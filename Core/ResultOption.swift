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

//extension ResultOption {
//    public func bind<B>(_ f: @escaping (T) -> ResultOption<B, E>) -> ResultOption<B, E> {
//        switch self {
//        case .ok(let x):
//            return f(x)
//        case .error(let e):
//            return ResultOption<B, E>.error(e)
//        }
//    }
//}

//extension ResultOption {
//    public func getValue(result: ResultOption<T, E>) -> T {
//        switch result {
//        case .ok(let x):
//            return x
//        case .error(let error):
//            return error as! T
//        }
//    }
//}

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
    public func isSuccess(result: ResultOption<T, E>) -> Bool {
        switch result {
        case .ok(_):
            return true
        case .error(_):
            return false
        }
    }
}
