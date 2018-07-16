//
//  TabBar.swift
//
//  Copyright © 2018 GabrielSilveira. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation
import UIKit

public protocol TabBarDelegate: class {
    func didPressTabBarItem(atIndex index: Int)
}

public class TabBar : NibDesignableControl {
    
    @IBOutlet public weak var firstItemImageView: UIImageView! {
        didSet {
            print("xablau")
        }
    }
    @IBOutlet public weak var secondItemImageView: UIImageView!
    @IBOutlet public weak var thirdItemImageView: UIImageView!
    @IBOutlet public weak var fourthItemImageView: UIImageView!
    @IBOutlet public weak var fifthItemImageView: UIImageView!
    
    var selectedItemTintColor = UIColor(red: 1/255, green: 104/255, blue: 132/255, alpha: 1) {
        didSet {
            indicatorView.backgroundColor = selectedItemTintColor
        }
    }
    
    public var itemTintColor = UIColor.lightGray
    
    @IBOutlet private weak var firstTabBarItem: UIView! {
        didSet {
            firstTabBarItem.isUserInteractionEnabled = true
            firstTabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressTabBarItem(_:))))
            firstTabBarItem.tag = 0
        }
    }
    
    @IBOutlet private weak var secondTabBarItem: UIView! {
        didSet {
            secondTabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressTabBarItem(_:))))
            secondTabBarItem.tag = 1
        }
    }
    
    @IBOutlet private weak var thirdTabBarItem: UIView! {
        didSet {
            thirdTabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressTabBarItem(_:))))
            thirdTabBarItem.tag = 2
        }
    }
    
    @IBOutlet private weak var fourthTabBarItem: UIView! {
        didSet {
            fourthTabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressTabBarItem(_:))))
            fourthTabBarItem.tag = 3
        }
    }
    
    @IBOutlet private weak var fifthTabBarItem: UIView! {
        didSet {
            fifthTabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressTabBarItem(_:))))
            fifthTabBarItem.tag = 4
        }
    }
    
    @IBOutlet private weak var indicatorView: UIView! {
        didSet {
            indicatorView.backgroundColor = selectedItemTintColor
        }
    }
    
    @IBOutlet private weak var indicatorViewCenterXConstraint: NSLayoutConstraint!
    
    public var delegate:TabBarDelegate?
    
    @objc func didPressTabBarItem(_ sender: UITapGestureRecognizer) {
        guard let tabBarItem = sender.view else {
            return
        }
        
        delegate?.didPressTabBarItem(atIndex: tabBarItem.tag)
        self.animateTabbarItem(tabBarItem)
    }
    
    public func pressProgramatically(atIndex index: Int) {
        if let tabBarItem = viewWithTag(index) {
            animateTabbarItem(tabBarItem)
            delegate?.didPressTabBarItem(atIndex: index)
        }
    }
    
    private func animateTabbarItem(_ tabBarItem: UIView) {
        indicatorViewCenterXConstraint.constant = tabBarItem.center.x - tabBarItem.frame.size.width/2
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}


