//
//  CompanyApplicationModel.swift
//  Company
//
//  Created by MACPRO on 2020-08-16.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct CompanyApplicationModel : RequestDataAble {
    let companyId: String
    let companyName: String
    let companyContact: CompanyContactApplicationModel
}

struct CompanyContactApplicationModel : RequestDataAble {
    let email: String
    let phoneNumber: String
}
