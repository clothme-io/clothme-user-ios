//
//  ContentView.swift
//  ClothME
//
//  Created by MACPRO on 2020-03-23.
//  Copyright © 2020 Paul Ikhane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let profile = ProfileViewModel().removeUser()
    var body: some View {
        Text(profile)
    }
    var text: some View {
        Text("Welcome to Fashion")
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
