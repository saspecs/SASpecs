//
//  BaseWKWebView.swift
//  SASpecs
//
//  Created by 鲁小权 on 2019/9/30.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit
import WebKit

/*
    父类 WKWebView
 */
class BaseWKWebView: WKWebView {
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = UIColor.white
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        
    }
}
