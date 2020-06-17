//
//  ConnectionRepository.swift
//  Connection
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


protocol ConnectionRepository : IRepositoryWithTypedId {
    func getConnectionByConnectionId<T: RequestDataAble, R: ResponseDataAble>(with data: T) -> Future<R, ConnectionError>
    func getAllConnections<T: RequestDataAble, R: ResponseDataAble>(with data: T) -> Future<[R], ConnectionError>
    func findConnectionByConnectionId<T: RequestDataAble, R: ResponseDataAble>(with data: T) -> Future<R, ConnectionError>
    func findConnectionByConnectionName<T: RequestDataAble, R: ResponseDataAble>(with data: T) -> Future<R, ConnectionError>
}
