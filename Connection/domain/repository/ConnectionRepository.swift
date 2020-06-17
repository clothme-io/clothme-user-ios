//
//  ConnectionRepository.swift
//  Connection
//
//  Created by MACPRO on 2020-04-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

protocol ConnectionRepository : IRepositoryWithTypedId {
    func getConnectionById(_ id: String) -> Connection
    func getAllConnections(_ id: String) -> [Connection]
    func findConnectionById(_ id: String) -> Connection
    func findConnectionByConnectionName(_ name: String) -> Connection
}
