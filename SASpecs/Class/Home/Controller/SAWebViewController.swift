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
    
    lazy var wkConfig: BaseWKConfiguration! = BaseWKConfiguration(self)
    
    let HTML = try! String(contentsOfFile: Bundle.main.path(forResource: "index", ofType: "html")!, encoding: String.Encoding.utf8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WKWebView网页测试"
        view.backgroundColor = UIColor.lightGray
                
        WKWeb = WKWebView(frame: view.bounds, configuration: wkConfig).then({ (v) in
            view.addSubview(v)
            v.scrollView.bounces = true
            v.scrollView.alwaysBounceVertical = true
            v.navigationDelegate = self
            v.loadHTMLString(HTML, baseURL: nil)
            v.allowsBackForwardNavigationGestures = true
//            if let url = URL(string: "https://www.qianniuniu.com") {
//                var req = URLRequest(url: url)
//                req.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
//                v.load(req)
//            }
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
    
    deinit {
        if wkConfig != nil, let contentVC = wkConfig.contentController {
            contentVC.removeScriptMessageHandler(forName: WKJSToNativeName.openUrl.rawValue)
        }
        debugPrintOnly("\(self) is deinit ......")
    }
}

extension SAWebViewController: WKJSImplementDelegate {
    func openUrl(_ param: String) {
        debugPrintOnly("JS调用成功啦！！！参数值为========  \(param)")
    }
}

extension SAWebViewController: WKNavigationDelegate {
    
    // 页面开始加载时调用，与UIWebView的代理：shouldStartLoadWith request对应 第一步
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {        debugPrintOnly("didStartProvisionalNavigation navigation ======")
    }
    
    //  页面加载失败时调用，与UIWebView的代理：didFailLoadWithError error对应 第三步
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        debugPrintOnly("didFailProvisionalNavigation navigation ======")
    }
    
    // 当内容开始返回时调用，与UIWebView的代理：webViewDidStartLoad对应
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        debugPrintOnly("didCommit navigation ======")
    }
    
    // 页面加载完成之后调用，与UIWebView的代理：webViewDidFinishLoad对应  第二步
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrintOnly("didFinish navigation ======")
        WKWeb.evaluateJavaScript("document.title") { (title, error) in
            let titleStr = title as? String ?? ""
            self.title = titleStr
        }
        
        webView.evaluateJavaScript("sayHello('WebView你好！')") { (result, err) in
            print(result, err)
        }
    }
    
    // 提交发生错误时调用，与UIWebView的代理：didFailLoadWithError error对应  第三步
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrintOnly("didFail navigation ======")
    }
    
    // 接收到服务器跳转请求即服务器重定向时之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        debugPrintOnly("didReceiveServerRedirectForProvisionalNavigation navigation ======")
    }
    
    // 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        debugPrintOnly("decidePolicyFor navigationAction ======")
    }
    
    // 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
        debugPrintOnly("decidePolicyFor navigationResponse ======")
    }

}
