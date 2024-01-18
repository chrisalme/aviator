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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backView] .forEach(addSubview(_:))
    }
    
    private func setupConstraints() {
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

    }
}
