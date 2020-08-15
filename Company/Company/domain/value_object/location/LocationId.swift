//
//  LocationId.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class LocationId : Entity {
    private override init(_id: Guid?) {
            super.init(_id: _id)
    }
      
    static func create(id: Guid?) -> ResultOption<LocationId, AppError> {
        return .ok(LocationId(_id: id ?? Guid(value: nil)))
    }
      
    public func value() -> Guid {
        return self.eId
    }
    
    public func valueString() -> String {
        return self.eId.toIdString()
    }
}
