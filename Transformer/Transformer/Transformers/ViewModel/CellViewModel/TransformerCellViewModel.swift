//
//  TransformerCellViewModel.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-06.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import Foundation

struct TransformerCellViewModel {
    var id: String
    var name: String
    var rank: Int
    var type: String
}

extension TransformerCellViewModel {
    init(transformer: Transformer) {
        self.id = transformer.id
        self.name = transformer.name
        self.type = transformer.type
        self.rank = transformer.rank
    }
}
