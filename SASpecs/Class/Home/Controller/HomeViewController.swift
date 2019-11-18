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
            t.showsVerticalScrollIndicator = false
            t.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.identifier)
            t.snp.makeConstraints({ (make) in
                make.left.right.top.bottom.equalTo(view)
            })
        })
    }
    
    func getDetailText(from index: Int) -> String {
        switch index {
            case 0:
                return "WKWebView调试"
            case 1:
                return "UIWebView调试"
            case 2:
                return "悬浮按钮调试"
            default:
                return ""
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.identifier, for: indexPath) as! HomeTableCell
        cell.loadData("第\(indexPath.row)行", descStr: getDetailText(from: indexPath.row))
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
        tableView.deselectRow(at: indexPath, animated: true)
        debugPrintOnly("点击第\(indexPath.row)行成功！！！")
        switch indexPath.row {
        case 0:
            let webVC = SAWebViewController()
            navigationController?.pushViewController(webVC, animated: true)
        case 1:
            let normalWebVC = NormalWebController()
            navigationController?.pushViewController(normalWebVC, animated: true)
        case 2:
            let buttonVC = ButtonViewController()
            navigationController?.pushViewController(buttonVC, animated: true)
        default:
            return
        }
    }
}

