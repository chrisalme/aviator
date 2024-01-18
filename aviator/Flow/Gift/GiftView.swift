//
//  GiftView.swift
//  aviator

import Foundation
import UIKit

class GiftView: UIView {

    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var giftAviatorTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: -56, right: 0)
        tableView.register(GiftCell.self, forCellReuseIdentifier: GiftCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backView,giftAviatorTableView] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        giftAviatorTableView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

