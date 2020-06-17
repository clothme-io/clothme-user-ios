//
//  CardPayment.swift
//  Payment
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct CardPayment {
    
    private var nameOnCard: NameOnCard
    private var cardNumber: CardNumber
    private var expiryDate: ExpiryDate
    private var ccNumber: ccNumber
}



extension CardPayment : Equatable {
    
    static func == (lhs: CardPayment, rhs: CardPayment) -> Bool {
        return lhs.cardNumber == rhs.cardNumber &&
            lhs.nameOnCard == rhs.nameOnCard &&
            lhs.expiryDate == rhs.expiryDate &&
            lhs.ccNumber == rhs.ccNumber
    }
}
