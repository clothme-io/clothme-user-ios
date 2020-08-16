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
    
    private init(
        companyId: CompanyId,
        companyName: CompanyName,
        companyContact: CompanyContact
    ) {
        self._companyId = companyId
        self._companyName = companyName
        self._companyContact = companyContact
        super.init(_id: Guid(value: companyId.value().toIdString()))
    }
    
    static func create(
        companyId: CompanyId,
        companyName: CompanyName,
        companyContact: CompanyContact
    ) -> ResultOption<Company, AppError> {
        return .ok(Company(
            companyId: companyId,
            companyName: companyName,
            companyContact: companyContact)
        )
    }
    
    func getCompanyId() -> CompanyId {
        return self._companyId
    }
    
    func getCompanyName() -> CompanyName {
        return self._companyName
    }
    
    func getCompanyContact() -> CompanyContact {
        return self._companyContact
    }
    
}
