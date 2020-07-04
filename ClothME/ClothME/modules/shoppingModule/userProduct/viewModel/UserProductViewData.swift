//
//  UserProductViewData.swift
//  ClothME
//
//  Created by MACPRO on 2020-07-03.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class UserProductViewData: ObservableObject {
    //INPUT

    
    //OUTPUT
    @EnvironmentObject var userId: UserDefaults
    @Published var firstName = ""
    
    @Published var productDetails = [Product]()

}


class Product: ObservableObject {
    //INPUT
    
    //OUTPUT
    @Published var productId = ""
    @Published var productImages: [String]?
    @Published var productName = ""
    @Published var productPrice = ""
    @Published var percentageFit = ""
    @Published var dicountPrice = ""
    @Published var likeCount = ""
    @Published var reviewCount = ""
    
    //Brand
    @Published var brandId = ""
    @Published var brandLogo = ""
    @Published var brandName = ""
    @Published var brandLocation = ""
}
