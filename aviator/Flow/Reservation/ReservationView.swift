//
//  ReservationView.swift
//  aviator

import Foundation
import UIKit

class ReservationView: UIView {

    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var reservTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: -56, right: 0)
        tableView.register(reservCell.self, forCellReuseIdentifier: reservCell.reuseId)
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
        [backView,reservTableView] .forEach(addSubview(_:))
        
    }
    
    private func setupConstraints() {
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        reservTableView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}



