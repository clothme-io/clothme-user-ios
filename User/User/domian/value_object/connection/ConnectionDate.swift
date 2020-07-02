//
//  ConnectionDate.swift
//  User
//
//  Created by MACPRO on 2020-05-10.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

struct ConnectionDate : Equatable {
    
  private var _date: Date
       
   private init() {
       self._date = Date()
   }
   
   static func create () -> String {
       let date = self.init()
       let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
       let dateString = dateFormatter.string(from: date._date)
       return dateString
   }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self._date)
    }
}
