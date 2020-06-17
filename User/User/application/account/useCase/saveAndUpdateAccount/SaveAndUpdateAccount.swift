//
//  SaveAndUpdateAccount.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


struct SaveAndUpdateAccount : UseCaseAble {
    
    private let _connectionRepo: ConnectionRepository
    private let _connectionMapper: MapperAble
    
    init(connectionRepo: ConnectionRepository, connectionMapper: MapperAble) {
        self._connectionRepo = connectionRepo
        self._connectionMapper = connectionMapper
    }
    
    public func execute(with data: SaveAndUpdateAccountDTO) {}
    
}
