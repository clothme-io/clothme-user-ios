//
//  DateAdded.swift
//  User
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

struct DateAdded {
    private var _date: Date
    
    private init() {
        self._date = Date()
    }
    
    static func create () -> String {
        let date = self.init()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateString = dateFormatter.string(from: date._date)
        return dateString
    }
}
