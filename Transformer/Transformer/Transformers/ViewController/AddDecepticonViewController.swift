//
//  AddDecepticonViewController.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import UIKit

class AddDecepticonViewController: UIViewController {

    @IBOutlet weak var decepticonImage: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var strength: UITextField!
    @IBOutlet weak var intelligence: UITextField!
    @IBOutlet weak var speed: UITextField!
    @IBOutlet weak var endurance: UITextField!
    @IBOutlet weak var firepower: UITextField!
    @IBOutlet weak var rank: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add Decpticon"
    }
    
    @IBAction func addDecepticonBtn(_ sender: Any) {
    }
    

}
