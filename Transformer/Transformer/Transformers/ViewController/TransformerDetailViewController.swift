//
//  TransformerDetailViewController.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import UIKit

class TransformerDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add Decpticon"
    }

}
