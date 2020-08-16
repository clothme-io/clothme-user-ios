//
//  LocationApplicationModel.swift
//  Company
//
//  Created by MACPRO on 2020-08-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct LocationApplicationModel : RequestDataAble {
    
    let locationId: String
    let locationName: String
    let locationAddress: LocationAddressApplicationModel
    let review: [LocationReviewApplicationModel]
    let operationDuration: LocationOperationDurationApplicationModel
    let launchDate: String
    let locationContact: LocationContactApplicationModel
 
}

struct LocationReviewApplicationModel : RequestDataAble {
    let text: String;
    let star: Double
}

struct LocationAddressApplicationModel : RequestDataAble {
    let streetNumber: String
    let streetName: String
    let city: String
    let country: String
}

struct LocationContactApplicationModel : RequestDataAble {
    let email: String
    let phoneNumber: String
}

struct LocationOperationDurationApplicationModel : RequestDataAble {
    let year: Int
    let month: Int
    let day: Int
}
