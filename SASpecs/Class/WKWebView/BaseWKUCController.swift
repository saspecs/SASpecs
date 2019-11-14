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
    
    override init() {
        super.init()
        
        // 成对出现
        self.add(self, name: "")
        self.removeScriptMessageHandler(forName: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BaseWKUCController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        <#code#>
    }
}
