//
//  AccountRepository.swift
//  User
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


protocol AccountRepository : IRepositoryWithTypedId {
    func searchAccountByName (with data: RequestDataAble) -> Result<ResponseDataAble, AccountError>
    
    func getAllAccount (with data: RequestDataAble) -> Future<[ResponseDataAble], AccountError>
    
    func getAccountByAccountId (with data: RequestDataAble) -> Future<ResponseDataAble, AccountError>
    
    func removeAccount (with data: RequestDataAble) -> Future<Void, AccountError>
    
    func sendAccount (with data: RequestDataAble) -> Future<ResponseDataAble, AccountError>
    
    func acceptAccount (with data: RequestDataAble) -> Future<ResponseDataAble, AccountError>
    
    func declineAccount (with data: RequestDataAble) -> Future<ResponseDataAble, AccountError>
}
