//
//  BaseWKUCController.swift
//  SASpecs
//
//  Created by 鲁小权 on 2019/9/30.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit
import WebKit

/*
    父类 WKUserContentController
 */
class BaseWKUCController: WKUserContentController {
    
    weak var messageHandleDelegate: WKJSImplementDelegate?
    
    override init() {
        super.init()
        
        // 成对出现
        add(self, name: WKJSToNativeName.openUrl.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        removeScriptMessageHandler(forName: WKJSToNativeName.openUrl.rawValue)
        debugPrintOnly("\(self) is deinit ......")
    }
    
}

// 实现代理遵循WKScriptMessageHandler
extension BaseWKUCController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        debugPrintOnly(message.name)
        debugPrintOnly(message.body)
        debugPrintOnly(message.frameInfo)
                
        guard let delegate = messageHandleDelegate else {
            return
        }
        
        switch message.name {
            case WKJSToNativeName.openUrl.rawValue:
                if delegate.responds(to: #selector(delegate.openUrl(_:))) {
                    DispatchQueue.main.async {
                        delegate.openUrl(message.body as? String ?? "")
                    }
                }
            default:
                return
        }
    }
}
