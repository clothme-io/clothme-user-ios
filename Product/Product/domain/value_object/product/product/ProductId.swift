//
//  ProductId.swift
//  Product
//
//  Created by MACPRO on 2020-05-11.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public class ProductId: Entity {
    
    private override init(_id: Guid?) {
           super.init(_id: _id)
       }
         
       static func create(id: Guid?) -> ResultOption<ProductId, AppError> {
           return .ok(ProductId(_id: id ?? Guid(value: nil)))
       }
         
       public func value() -> Guid {
           return self.eId
       }
       
       public func valueString() -> String {
           return self.eId.toIdString()
       }
    
}
