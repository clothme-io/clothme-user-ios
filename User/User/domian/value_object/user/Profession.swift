//
//  Profession.swift
//  User
//
//  Created by MACPRO on 2020-03-28.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct Profession : Equatable {
    private let _value: String;
    
    private init(profession: String){
        self._value = profession;
    }
    
    public static func create (profession: String) -> ResultOption<Profession, AppError> {
        let validProfession = Guard.againstNilValue(argument: profession)
        if !validProfession {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(Profession(profession: profession))
    }
    
//    public func change (newProfession new: String, oldProfession old: Profession) -> ResultOption<Profession, AppError> {
//        if new == old._value {
//            return .error(AppError.sameValueNotAllowed)
//        }
//        return Profession.validateForEmptyValue(input: new)
//            .bind(Profession.validateForNilValue)
//            .bind(Profession.initProfession(_:))
//    }
    
    var value: String {
        return self._value
    }
    
}
