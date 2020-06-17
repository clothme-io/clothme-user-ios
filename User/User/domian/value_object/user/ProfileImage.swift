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

    public static func set (image: String) -> ResultOption<ProfileImage, ValidationError> {
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
    
    private static func validateProfileImageForEmptyValue (inputName: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstEmptyString(argument: inputName)
        if validName {
            return .ok(inputName)
        }
        return .error(ValidationError.emptyValueNotAllowed)
    }
    
    private static func validateProfileImageForNilValue (input: String) -> ResultOption<String, ValidationError> {
        let validName = Guard.AgainstNilString(argument: input)
        if validName {
            return .ok(input)
        }
        return .error(ValidationError.nilValueNotAllowed)
    }
    
    private static func initProfileImage(input: String) -> ResultOption<ProfileImage, ValidationError> {
        if input.isEmpty {
            return .error(ValidationError.emptyValueNotAllowed)
        }
        return .ok(ProfileImage(image: input))
    }
}

