//
//  ConnectionDate.swift
//  User
//
//  Created by MACPRO on 2020-05-10.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation


struct ConnectionDate : Equatable {
    
    private var date: String
    
    private init(date: String) {
        self.date = date
    }
    
    var value : String {
        self.date
    }
}
