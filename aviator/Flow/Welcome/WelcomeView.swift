//
//  WelcomeView.swift


import Foundation
import UIKit

class WelcomeView: UIView {
    

    private(set) lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.backgroundsWelcome
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .welcomeLabel
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private(set) lazy var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "+100"
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 60)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var thankButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customRed
        button.setTitle("Thank You", for: .normal)
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
        addSubview(backView)
        addSubview(welcomeImageView)
        addSubview(pointLabel)
        addSubview(thankButton)
        
    }
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        welcomeImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(64)
            make.left.right.equalToSuperview().inset(24)
        }
        
        thankButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(188)
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-36)
        }
        
        pointLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(thankButton.snp.top).offset(-48)
            make.centerX.equalToSuperview()
        }
    }
    
}

