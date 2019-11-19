//
//  BaseWKScriptMessageHandler.swift
//  SASpecs
//
//  Created by Smalla on 2019/10/25.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import Foundation
import WebKit

/// JS调用原生方法名
enum WKJSToNativeName: String {
    case openUrl = "openUrl"
}

/// 原生调用JS方法名
enum WKNativeToJSName: String {
    case cancelAction = "cancelAction"
}


@objc
protocol WKJSImplementDelegate: NSObjectProtocol {
   @objc func openUrl(_ param: String)
}


class WKScriptMessageHandleDelegate: NSObject {
    weak var messageHandleDelegate: WKScriptMessageHandler?
}

extension WKScriptMessageHandleDelegate: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let delegate = messageHandleDelegate else {
            return
        }
        if delegate.responds(to: #selector(userContentController(_:didReceive:))) {
            delegate.userContentController(userContentController, didReceive: message)
        }
    }
}
