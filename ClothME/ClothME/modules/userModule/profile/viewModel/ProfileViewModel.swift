//
//  ProfileViewModel.swift
//  ClothME
//
//  Created by MACPRO on 2020-05-31.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI
import Combine
import User

final class ProfileViewModel {
    
//    private let userRepositoryImpl: UserRepositoryImpl = UserRepositoryImpl()
    
    private var bag = Set<AnyCancellable>()
    
    func getUser() {}
    
    func editUser() {}
    
    func blockUser() {}
    
    func removeUser() {}
    
}

struct ProfileViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
