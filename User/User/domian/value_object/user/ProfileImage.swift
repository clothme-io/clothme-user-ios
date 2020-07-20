//
//  ProfileImage.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Core

struct ProfileImage: Equatable {
    
    private var _value: String
    
    private init(image: String) {
        self._value = image
    }

    public static func set (image: String) -> ResultOption<ProfileImage, AppError> {
        return validateProfileImageForEmptyValue(inputName: image)
                .bind(validateProfileImageForNilValue)
                .bind(initProfileImage)
    }
    
    var value: String {
        return self._value
    }
}

// MARKDOWN : Validation
extension ProfileImage {
    
    private static func validateProfileImageForEmptyValue (inputName: String) -> ResultOption<String, AppError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(AppError.emptyValueNotAllowed)
    }
    
    private static func validateProfileImageForNilValue (input: String) -> ResultOption<String, AppError> {
        let validName = Guard.againstNilValue(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(AppError.nilValueNotAllowed)
    }
    
    private static func initProfileImage(input: String) -> ResultOption<ProfileImage, AppError> {
        if input.isEmpty {
            return .error(AppError.emptyValueNotAllowed)
        }
        return .ok(ProfileImage(image: input))
    }
}

