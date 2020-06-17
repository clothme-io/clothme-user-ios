//
//  UseCase.swift
//  Core
//
//  Created by MACPRO on 2020-05-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation

public protocol UseCaseAble {
    associatedtype input
    associatedtype output
    func execute(with data: input) -> output
}
