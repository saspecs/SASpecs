//
//  BaseWKConfiguration.swift
//  SASpecs
//
//  Created by 鲁小权 on 2019/9/30.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit
import WebKit

/*
    父类 WKWebViewConfiguration
 */
class BaseWKConfiguration: WKWebViewConfiguration {
    
    weak var contentController: BaseWKUCController!
    
    convenience init(_ delegate: WKJSImplementDelegate?) {
        self.init()
        
        contentController = BaseWKUCController().then({ (c) in
            c.messageHandleDelegate = delegate
            userContentController = c
        })
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
