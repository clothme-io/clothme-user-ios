//
//  SignInViewModel.swift
//  ClothME
//
//  Created by MACPRO on 2020-05-24.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI
import Combine
import User

final class SignInViewModel {
    
    private let authRepositoryImpl: AuthRepositoryImpl = AuthRepositoryImpl()
    
    private var bag = Set<AnyCancellable>()
    
    func signInEmail() {}
    
    func signInWithFacebook() {}
    
    func signInWithGoogle() {}
    
}
