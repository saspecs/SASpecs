//
//  NormalWebController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class NormalWebController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIWebView网页测试"
        view.backgroundColor = UIColor.lightGray
        
        _ = UIWebView(frame: view.bounds).then({ (v) in
            view.addSubview(v)
            //            v.navigationDelegate = self
            if let url = URL(string: "https://www.qianniuniu.com") {
                var req = URLRequest(url: url)
                req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
                v.loadRequest(req)
            }
            v.snp.makeConstraints({ (make) in
                if BasicTool.isIPhoneXSeries {
                    make.top.equalTo(BasicTool.iphoneXSafeAreaInsets().top + NavigationBarDefaultHeight)
                }else{
                    make.top.equalTo(TopLayoutDefaultHeight)
                }
                make.bottom.left.right.equalTo(self.view)
            })
        })
    }
}