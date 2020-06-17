//
//  Payment.swift
//  Payment
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

enum PaymentType : PaymentAble {
    case Card(CardPayment);
    case Cash(CashPayment);
}
