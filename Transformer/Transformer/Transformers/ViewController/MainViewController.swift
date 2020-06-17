//
//  MainViewController.swift
//  Transformer
//
//  Created by MACPRO on 2019-06-07.
//  Copyright © 2019 Paul Ikhane. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()
        setUpUI()
        
    }
    
    func setUpTabBar() {
        tabBar.barTintColor = UIColor.lightGray
    }
    
    func setUpUI() {
        let transformerListVC = createTabViews(viewController: TransformerListViewController(), image: UIImage(named: "transformer")!, selectedImage: UIImage(named: "transformerSelected")!)
        
        let autobotStoryboard = UIStoryboard(name: "AddAutobot", bundle: nil)
        let autobotViewController = autobotStoryboard.instantiateViewController(withIdentifier: "AddAutobotViewController")
        let addAutobotVC = createTabViews(viewController: autobotViewController, image: UIImage(named: "autobot")!, selectedImage: UIImage(named: "autoboSelected")!)
        
        
        let decepticonStoryboard = UIStoryboard(name: "AddDecepticon", bundle: nil)
        let decepticonViewController = decepticonStoryboard.instantiateViewController(withIdentifier: "AddDecepticonViewController")
        let addDecepticonVC = createTabViews(viewController: decepticonViewController, image: UIImage(named: "decepticon")!, selectedImage: UIImage(named: "decepticonSelected")!)
        
        let battleStoryBoard = UIStoryboard(name: "Battle", bundle: nil)
        let battleViewController = battleStoryBoard.instantiateViewController(withIdentifier: "BattleViewController")
        let battleVC = createTabViews(viewController: battleViewController, image: UIImage(named: "battleImage")!, selectedImage: UIImage(named: "battleImgSelected")!)

        viewControllers = [ transformerListVC, addAutobotVC, addDecepticonVC, battleVC ]
        
        guard let tabItems = tabBar.items else { return }
        for item in tabItems {
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -4, right: 0)
        }
        
    }

}

extension UITabBarController {
    func createTabViews(viewController: UIViewController, image: UIImage, selectedImage: UIImage) -> UINavigationController {
        let viewController = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.image = image
        navigationController.tabBarItem.selectedImage = selectedImage
        
        return navigationController
    }

}
