//
//  CompanyRepository.swift
//  Company
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class CompanyMapper {
    
    static func toDomainModel(data: CompanyApplicationModel) -> ResultOption<Company, AppError> {
        let companyId = CompanyId.create(id: Guid(value: data.companyId)).OptionalData().value!
        let companyName = CompanyName.create(with: data.companyName).OptionalData().value!
        let companyContact = CompanyContact.create(
            email: data.companyContact.email,
            phoneNumber: data.companyContact.phoneNumber).OptionalData().value!
        
        return .ok(Company.create(
            companyId: companyId,
            companyName: companyName,
            companyContact: companyContact).OptionalData().value!
        )
    }
    
    static func toDataModel(model: Company) -> CompanyApplicationModel {
        return CompanyApplicationModel(
            companyId: model.getCompanyId().value().toIdString(),
            companyName: model.getCompanyName().name,
            companyContact: CompanyContactApplicationModel(
                email: model.getCompanyContact().email,
                phoneNumber: model.getCompanyContact().phoneNumber)
        )
    }
}
