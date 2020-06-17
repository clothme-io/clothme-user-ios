//
//  TransformerTableViewCellType.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-06.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation


enum TransformerTableViewCellType {
    case normal(cellViewModel: TransformerCellViewModel)
    case error(message: String)
    case empty
}
