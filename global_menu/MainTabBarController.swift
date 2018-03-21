//
//  MainTabBarController.swift
//  PhraseSpace
//
//  Created by 井草俊輔 on 2018/02/14.
//  Copyright © 2018年 井草俊輔. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initIcon()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initIcon() {
        self.viewControllers![0].tabBarItem.image = UIImage(named: "edit.png")
        self.viewControllers![1].tabBarItem.image = UIImage(named: "reload.png")
    }
}
