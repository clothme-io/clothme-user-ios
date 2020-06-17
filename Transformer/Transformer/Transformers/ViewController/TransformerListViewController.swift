//
//  TransformerListViewController.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-06.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources


class TransformerListViewController: UIViewController {

    let transformerTableView = UITableView()
    
    let viewModel: TransformerTableViewViewModel = TransformerTableViewViewModel()
    private let dispoBag = DisposeBag()
    private var selectedTransformerPayload = ReadOnce<TransformerCellViewModel>(nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigationBar()
        view.addSubview(transformerTableView)
        setUpTablewViewContraint()
        
        transformerTableView.register(TransformerTableViewCell.self, forCellReuseIdentifier: "transformerCell")
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Transformers"
    }
    
    func setUpTablewViewContraint() {
        transformerTableView.translatesAutoresizingMaskIntoConstraints = false
        transformerTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        transformerTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        transformerTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        transformerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }

}
