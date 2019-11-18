//
//  HomeTableCell.swift
//  SASpecs
//
//  Created by Smalla on 2019/11/18.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {

    static let identifier: String = "HomeTableCell"
    
    weak var titleLabel: UILabel!
    
    weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        contentView.backgroundColor = UIColor.white
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        
        titleLabel = UILabel().then({ (l) in
            contentView.addSubview(l)
            if #available(iOS 13.0, *) {
                l.textColor = UIColor.label
            } else {
                l.textColor = UIColor.black
            }
            l.textAlignment = .left
            l.font = UIFont.systemFont(ofSize: 17)
            l.snp.makeConstraints { (make) in
                make.left.equalTo(contentView.snp.left).offset(15)
                make.centerY.equalTo(contentView)
            }
        })
        
        detailLabel = UILabel().then({ (l) in
            contentView.addSubview(l)
            if #available(iOS 13.0, *) {
                l.textColor = UIColor.label
            } else {
                l.textColor = UIColor.black
            }
            l.textAlignment = .right
            l.font = UIFont.systemFont(ofSize: 15)
            l.snp.makeConstraints { (make) in
                make.right.equalTo(contentView.snp.right).offset(-15)
                make.centerY.equalTo(contentView)
            }
        })
    }
    
    func loadData(_ titleStr: String, descStr: String) {
        titleLabel.text = titleStr
        detailLabel.text = descStr
    }
}
