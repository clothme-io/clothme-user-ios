//
//  LocationBadge.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct LocationBadge: Equatable {
    
    private var _verified: Bool
    
    private init(
        verified: Bool
    ) {
        self._verified = verified
    }
    
    public static func create(verified: Bool) -> ResultOption<LocationBadge, AppError> {
        let validName = Guard.againstNilValue(argument: verified)
        if !validName {
            return .error(AppError.nilValueNotAllowed)
        }
        return .ok(LocationBadge(verified: verified))
    }
    
    public var verified: Bool {
           return self._verified
    }
    
}
