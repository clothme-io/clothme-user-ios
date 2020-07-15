//
//  MeasurementRespository.swift
//  User
//
//  Created by MACPRO on 2020-05-04.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import Core


protocol MeasurementRepository : IRepositoryWithTypedId {
    func acceptMeasurement<T> (of type: RequestDataAble, with data: ResponseDataAble) -> Future<T, AppError>
}
