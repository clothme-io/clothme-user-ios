//
//  WishListApplicationModel.swift
//  Product
//
//  Created by MACPRO on 2020-05-30.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct WishListApplicationModel : RequestDataAble {
    let wishListId: String
    let wishListItem: [WishLIstItemApplicationModel]
    let dateAdded: String
}
