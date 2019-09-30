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
            v.delegate = self
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

extension NormalWebController: UIWebViewDelegate {
    
    // 准备加载页面
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
       return true
    }
    
    // 内容开始加载
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    // 页面加载完成时调用
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    
    // 页面加载失败调用
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
}
