//
//  Measurement.swift
//  User
//
//  Created by MACPRO on 2020-03-25.
//  Copyright © 2020 Paul Ikhane. All rights reserved.

//
import Foundation

enum Measurement : Equatable {
    case FullBody(FullBodyMeasurement);
    case Pant(BottomMeasurement);
    case Top(TopMeasurement);
    case Shoe(ShoeMeasurement);
}


struct UserMeasurement {
    
}
