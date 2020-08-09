//
//  ProductImage.swift
//  Product
//
//  Created by MACPRO on 2020-08-08.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Core

public struct ProductImage: Equatable {
    
    private let _images: [String]
    
    private init(
        images: [String]
    ) {
        self._images = images
    }
    
    public static func create(images: [String]) -> ResultOption<ProductImage, AppError> {
        return .ok(ProductImage(images: images))
    }
    
    func images() -> [String] {
        return self._images
    }
    
}
