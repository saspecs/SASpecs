//
//  SATabBar.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class SATabBar: UITabBar {
    var oldSafeAreaInsets = UIEdgeInsets.zero
    
    @available(iOS 11.0, *)
    override func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        
        if oldSafeAreaInsets != safeAreaInsets {
            oldSafeAreaInsets = safeAreaInsets
            
            invalidateIntrinsicContentSize()
            superview?.setNeedsLayout()
            superview?.layoutSubviews()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        
        if #available(iOS 11.0, *) {
            let bottomInsets = safeAreaInsets.bottom
            if bottomInsets > 0 && size.height < 50 && (size.height + bottomInsets) < 90 {
                size.height += bottomInsets
            }
        }
        
        return size
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var tmp = newValue
            if let superView = superview, tmp.maxY != superView.frame.height {
                tmp.origin.y = superView.frame.height - tmp.height
            }
            super.frame = tmp
        }
    }
}
