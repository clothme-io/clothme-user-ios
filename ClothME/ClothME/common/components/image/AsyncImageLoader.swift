//
//  AsyncImageLoader.swift
//  ClothME
//
//  Created by MACPRO on 2020-07-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func load() {}
    
    func cancel() {}
}
