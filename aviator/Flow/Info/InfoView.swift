//
//  InfoView.swift
//  aviator

import Foundation
import UIKit

class InfoView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var personBtn: UIButton = {
        let button = UIButton()
        button.setImage(.personBtn, for: .normal)
        return button
    }()

    private(set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 60)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to our convenient application for reserving seats for a variety of entertainment events! We offer you a simple and effective way to book a place for interesting events and enjoy a unique atmosphere. \nWhat makes our app special? We have created a system of bonuses and pleasant gifts to make your participation in events even more enjoyable. With every booking, you earn bonus points, which can be exchanged for various amenities and additional bonuses. \nImmerse yourself in a world of fun and entertainment with our application, stay up to date with the main events and get the most out of your time spent at events. Join us and enjoy bright emotions with your friends and loved ones!"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .regular, size: 14)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()
    
    private(set) lazy var infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(backView)
        addSubview(infoScrollView)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        addSubview(personBtn)
        
    }
    
    private func setupConstraints() {
     
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        personBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().inset(56)
        }
        
        infoScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(56)
        }
    }
}
