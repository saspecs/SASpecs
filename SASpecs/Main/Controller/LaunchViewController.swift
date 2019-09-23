//
//  LaunchViewController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/2.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit
let SASWindow = UIApplication.shared.delegate?.window!


class LaunchViewController: ViewController {

    weak var advertImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestLaunchImage()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        var imageName = ""
        let viewSize = view.bounds.size
        imageName = getLaunchImage(viewSize: viewSize)
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.frame = view.bounds
        view.addSubview(imageView)
        
        _ = UILabel().then({ (l) in
            view.addSubview(l)
            l.text = "SASPecs"
            l.textColor = UIColor.black
            l.font = UIFont.systemFont(ofSize: 13)
            l.textAlignment = .center
            l.snp.makeConstraints({ (make) in
                make.centerX.equalTo(view)
                make.bottom.equalTo(view.snp.bottom).offset(-15)
            })
        })
    }
    
    // MARK: - Methods
    func getLaunchImage(viewSize: CGSize) -> String {
        if let dic = Bundle.main.infoDictionary, let imagesArr = dic["UILaunchImages"] as? NSArray {
            for data in imagesArr {
                if let dict = data as? NSDictionary, let sizeStr = dict["UILaunchImageSize"] as? String {
                    let size = NSCoder.cgSize(for: sizeStr)
                    if size.equalTo(viewSize) && ("Portrait" == dict["UILaunchImageOrientation"] as? String ?? "") {
                        return dict["UILaunchImageName"] as? String ?? ""
                    }
                }
            }
        }
        return ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        debugPrint("\(self) is deinit......")
    }
}

extension LaunchViewController {
    
    func requestLaunchImage() {
        
        // 请求成功进入主页
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            let rootVC = SATabBarController()
            SASWindow?.backgroundColor = UIColor.white
            SASWindow?.rootViewController = rootVC
            SASWindow?.makeKeyAndVisible()
        }
    }
}
