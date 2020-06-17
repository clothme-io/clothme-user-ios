//
//  MemebrProtocol.swift
//  Circle
//
//  Created by MACPRO on 2020-04-01.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

protocol MemberType : AnyObject {
    func Send(with message: String)
    func Cancel()
    func Accept()
    func Decline()
    
}
