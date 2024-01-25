//
//  AddNewView.swift
//  aviator

import Foundation
import UIKit

class AddNewView: UIView {

    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var eventTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        tableView.register(AddNewCell.self, forCellReuseIdentifier: AddNewCell.reuseId)
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
        [backView,eventTableView] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        eventTableView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}

