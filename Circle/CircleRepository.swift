//
//  CircleRepository.swift
//  Circle
//
//  Created by MACPRO on 2020-04-10.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core


protocol CircleRepository : IRepositoryWithTypedId {
    func getCircleById()
    func findCircleByCircleName()
    func getAllCircleById()
}
