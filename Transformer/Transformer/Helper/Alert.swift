//
//  Alert.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import UIKit

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
