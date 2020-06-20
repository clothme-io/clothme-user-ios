//
//  DiscoveryViewModel.swift
//  ClothME
//
//  Created by MACPRO on 2020-05-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI
import Combine
import User

final class DiscoveryViewModel {
    
    private let brandViewModel: BrandViewModel = BrandViewModel()
    private let merchantViewModel: MerchantViewModel = MerchantViewModel()
    
    private var bag = Set<AnyCancellable>()
    
    func getConnection() {}
    
    func getAllConnections() {}
    
    func addConnection() {}
    
    func removeConnection() {}
    
}
