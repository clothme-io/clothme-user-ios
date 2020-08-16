//
//  LocationRepository.swift
//  Company
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class LocationMapper {
    
    static func toDomainModel(data: LocationApplicationModel) -> ResultOption<Location, AppError> {
         
     }
     
     static func toDataModel(model: Location) -> LocationApplicationModel {
         return LocationApplicationModel()
     }
    
}
