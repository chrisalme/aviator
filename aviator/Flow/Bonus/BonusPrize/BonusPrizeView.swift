//
//  BonusPrizeView.swift
//  aviator

import UIKit
import SnapKit

class BonusPrizeView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.backgroundsTimer
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
        label.font = .customFont(font: .mont, style: .bold, size: 52)
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
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(72)
            make.centerX.equalToSuperview()
        }
        
        scoreLifeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(winLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
        thanksButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.centerX.equalToSuperview()
            make.width.equalTo(188)
            make.height.equalTo(48)
        }
    }
}
