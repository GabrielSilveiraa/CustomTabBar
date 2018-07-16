//
//  ViewController.swift
//  CustomTabBar
//
//  Created by Gabriel Miranda Silveira on 01/06/18.
//  Copyright © 2018 GabrielSilveira. All rights reserved.
//

import UIKit
import CustomTabBar

class ViewController: UIViewController {

    var currentViewController: UIViewController?
    
    @IBOutlet weak var tabBar: TabBar! {
        didSet {
            tabBar.delegate = self
            tabBar.firstItemImageView.image = UIImage(named: "A")
            tabBar.secondItemImageView.image = UIImage(named: "B")
            tabBar.thirdItemImageView.image = UIImage(named: "C")
            tabBar.fourthItemImageView.image = UIImage(named: "D")
            tabBar.fifthItemImageView.image = UIImage(named: "E")
        }
    }
    
    @IBOutlet weak var containerView: UIView!
}

extension ViewController: TabBarDelegate {
    
    func didPressTabBarItem(atIndex index: Int) {
        var viewController: UIViewController?
        switch index {
        case 0:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "AViewController")
        case 1:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "BViewController")
        case 2:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "CViewController")
        case 3:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "DViewController")
        case 4:
            viewController = self.storyboard?.instantiateViewController(withIdentifier: "EViewController")
        default:
            break
        }
        
        if let viewController = viewController {
            currentViewController = changeViewControllerIn(containerView: containerView, newChildViewController: viewController, oldChildViewController: currentViewController)
        }
    }
}
