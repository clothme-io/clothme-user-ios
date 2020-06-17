//
//  BadgeType.swift
//  Product
//
//  Created by MACPRO on 2020-05-13.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

enum BadgeType {
    case delivery(DeliveryBadge)
    case returns(ReturnsBadge)
    case ethical(EthicalBadge)
    case refund(RefundBadge)
}
