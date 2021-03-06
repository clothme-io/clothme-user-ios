//
//  ForgotPasswordViewModel.swift
//  ClothME
//
//  Created by MACPRO on 2020-05-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI
import Combine
import User

final class ForgotPasswordViewModel: ObservableObject {
    
    private let authRepositoryImpl: AuthRepositoryImpl = AuthRepositoryImpl()
    
    private var bag = Set<AnyCancellable>()
    
    func forgotPassword() {}
    
}


