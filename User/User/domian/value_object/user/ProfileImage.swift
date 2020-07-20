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

    public static func set(with image: String) -> ResultOption<ProfileImage, AppError> {
        let validName = Guard.againstNilValue(argument: image)
        if validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(ProfileImage(image: image))
    }
    
    var value: String {
        return self._value
    }
}
