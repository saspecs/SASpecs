//
//  HomeViewController.swift
//  SASpecs
//
//  Created by Smalla on 2019/9/2.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class HomeViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "主页"
        view.backgroundColor = UIColor.green
        
        _ = UITableView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: .grouped).then({ (t) in
            view.addSubview(t)
            t.separatorStyle = .singleLine
            t.delegate = self
            t.dataSource = self
            t.rowHeight = 50
            t.snp.makeConstraints({ (make) in
                make.left.right.top.bottom.equalTo(view)
            })
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "第\(indexPath.row)行"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrintOnly("点击第\(indexPath.row)行成功！！！")
        switch indexPath.row {
        case 0:
            let webVC = SAWebViewController()
            navigationController?.pushViewController(webVC, animated: true)
        case 1:
            let normalWebVC = NormalWebController()
            navigationController?.pushViewController(normalWebVC, animated: true)
        default:
            return
        }
    }
}
