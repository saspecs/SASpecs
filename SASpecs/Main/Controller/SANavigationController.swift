//
//  SANavigationController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class SANavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count >= 1 {
            if viewController.navigationItem.leftBarButtonItem == nil {
                //setViewControllerBackButton(viewController)
            }
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
        
        if BasicTool.isIPhoneXSeries {
            if let frame = self.tabBarController?.tabBar.frame {
                let tabbarH = CGRect(x: frame.origin.x, y: UIScreen.main.bounds.size.height - frame.size.height, width: frame.size.width, height: frame.size.height)
                self.tabBarController?.tabBar.frame = tabbarH
            }
        }
    }
}
