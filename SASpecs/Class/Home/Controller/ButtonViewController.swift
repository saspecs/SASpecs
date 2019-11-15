//
//  ButtonViewController.swift
//  SASpecs
//
//  Created by Smalla on 2019/11/14.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class ButtonViewController: ViewController {

    weak var floatBtn: FloatButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "悬浮按钮Demo"
        view.backgroundColor = UIColor.white
        
        floatBtn = FloatButton(bgColor: UIColor.orange, titleOfButton: "设置").then { (b) in
            firstWindow?.addSubview(b)
            b.delegate = self
            b.snp.makeConstraints { (make) in
                make.top.equalTo(80)
                make.left.equalTo(20)
                make.width.equalTo(80)
                make.height.equalTo(50)
            }
        }
    }
}

extension ButtonViewController: FloatDelegate {
    func singleClick() {
        debugPrintOnly("单次点击事件")
    }
}
