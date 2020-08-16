//
//  CartApplicationModel.swift
//  Product
//
//  Created by MACPRO on 2020-05-30.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct CartApplicationModel : RequestDataAble {
    let wishListId: String
    let wishListItem: [CartItemApplicationModel]
    let dateAdded: String
}
