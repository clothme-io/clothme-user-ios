//
//  ReadOnce.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-08.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation

class ReadOnce<Value> {
    
    var isRead: Bool {
        return value == nil
    }
    
    private var value: Value?
    
    init(_ value: Value?) {
        self.value = value
    }
    
    func read() -> Value? {
        defer { value = nil }
        
        if value != nil {
            return value
        }
        
        return nil
    }
    
}
