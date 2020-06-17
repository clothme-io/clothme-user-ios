//
//  AcceptConnection.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct AcceptConnection : UseCaseAble {
    
    private let _connectionRepo: ConnectionRepository
    
    init(connectionRepo: ConnectionRepository) {
        self._connectionRepo = connectionRepo
    }
    
    
    public func execute(with data: EmailSignInDTO) {}
    
}
