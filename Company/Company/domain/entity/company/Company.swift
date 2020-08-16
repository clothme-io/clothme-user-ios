//
//  Company.swift
//  Company
//
//  Created by MACPRO on 2020-08-15.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class Company: AggregateRoot {
    private let _companyId: CompanyId
    private let _companyName: CompanyName
    private let _companyContact: CompanyContact
}
