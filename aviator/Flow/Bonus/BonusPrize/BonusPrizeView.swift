//
//  BonusPrizeView.swift
//  aviator

import UIKit
import SnapKit

class BonusPrizeView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.backgroundsWelcome
        return imageView
    }()
    
    private lazy var winLabel: UILabel = {
        let label = UILabel()
        label.text = "Congratilations"
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        return label
    }()
    
    private(set) lazy var scoreLifeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .customFont(font: .mont, style: .bold, size: 40)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var thanksButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customRed
        button.setTitle("Thanks", for: .normal)
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [backView,winLabel,thanksButton,scoreLifeLabel] .forEach(addSubview(_:))
    }
    
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        winLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(scoreLifeLabel.snp.top).offset(-100)
            make.centerX.equalToSuperview()
        }
        
        scoreLifeLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        thanksButton.snp.makeConstraints { (make) in
            make.top.equalTo(scoreLifeLabel.snp.bottom).offset(100)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(66)
        }
    }
}
