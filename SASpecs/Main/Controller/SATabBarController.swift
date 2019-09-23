//
//  SATabBarController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class SATabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = SATabBar().then({ (b) in
            b.isTranslucent = false
            b.tintColor = UIColor(hexadecimalString: "575757")
            self.setValue(b, forKey: "tabBar")
        })
        
        let homeVC = SANavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem.image = UIImage(named: "t_home")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.selectedImage = UIImage(named: "t_home_selected")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.title = "主页"
        
        let mineVC = SANavigationController(rootViewController: MineViewController())
        mineVC.tabBarItem.image = UIImage(named: "t_mine")?.withRenderingMode(.alwaysOriginal)
        mineVC.tabBarItem.selectedImage = UIImage(named: "t_mine_selected")?.withRenderingMode(.alwaysOriginal)
        mineVC.tabBarItem.title = "个人中心"
        
        viewControllers = [homeVC, mineVC]
    }
}
