//
//  ProductMap.swift
//  Product
//
//  Created by MACPRO on 2020-05-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

class ProductMapper {
    
    static func toDomainModel(data: ProductApplicationModel) -> ResultOption<Product, AppError> {
        return .ok(product)
    }
    
    static func toDataModel(model: Product) -> ProductApplicationModel {
        
    }
}
