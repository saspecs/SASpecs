//
//  SAWebViewController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit
import WebKit

class SAWebViewController: ViewController {

    weak var WKWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WKWebView网页测试"
        view.backgroundColor = UIColor.lightGray
        
        WKWeb = WKWebView(frame: view.bounds).then({ (v) in
            view.addSubview(v)
            v.navigationDelegate = self
            if let url = URL(string: "https://www.qianniuniu.com") {
                var req = URLRequest(url: url)
                req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
                v.load(req)
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
        
        WKWeb.evaluateJavaScript("document.title") { (title, error) in
            let titleStr = title as? String ?? ""
            self.title = titleStr
        }
    }
}

extension SAWebViewController: WKNavigationDelegate {
    // 允许或取消导航
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        debugPrintOnly("decidePolicyFor navigationAction ======")
    }
    // 拿到response之后再次询问允许或取消导航
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
        debugPrintOnly("decidePolicyFor navigationResponse ======")
    }
    // 主框架导航开始时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {        debugPrintOnly("didStartProvisionalNavigation navigation ======")
    }
    // 内容开始到达主框架时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        debugPrintOnly("didCommit navigation ======")
    }

    // 加载完成时调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrintOnly("didFinish navigation ======")
    }

    // 加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrintOnly("didFail navigation ======")
    }

    //  主框架导航开始加载时，如果发生错误时调用
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        debugPrintOnly("didFailProvisionalNavigation navigation ======")
    }
}
