

import Foundation
import UIKit

class DetailView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsWelcome
        return imageView
    }()
    
    private(set) lazy var closeBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(.closeBtn, for: .normal)
        return button
    }()
    
    private lazy var titleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        label.text = "Gift".uppercased()
        return label
    }()
    
    private lazy var giftDetailUseConteiner: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.backgroundColor = .white.withAlphaComponent(0.18)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var giftDetailConteiner: UIView = {
        let view = UIView()
        return view
    }()
    
    private(set) lazy var subTitleGiftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var giftDetailImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    
    private(set) lazy var creditsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Credits"
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 20)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var creditsScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var cointsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .aviatorCoins
        return imageView
    }()
    
    private(set) lazy var descriptionBodyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .regular, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var payHideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customRed
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        button.layer.cornerRadius = 20
        return button
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
        
        [backView,closeBtn,titleGiftLabel,giftDetailUseConteiner] .forEach(addSubview(_:))
        
        
        giftDetailUseConteiner.addSubview(giftDetailImage)
        giftDetailUseConteiner.addSubview(subTitleGiftLabel)
        giftDetailUseConteiner.addSubview(payHideButton)
        giftDetailUseConteiner.addSubview(creditsLabel)
        giftDetailUseConteiner.addSubview(cointsImageView)
        giftDetailUseConteiner.addSubview(creditsScoreLabel)
        giftDetailUseConteiner.addSubview(descriptionLabel)
        giftDetailUseConteiner.addSubview(descriptionBodyLabel)
        
    }
    private func setupConstraints() {
   
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
        }
        
        titleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(closeBtn.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }

        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().offset(-60)
        }

        payHideButton.snp.makeConstraints { make in
            make.centerX.equalTo(giftDetailUseConteiner)
            make.bottom.equalTo(giftDetailUseConteiner.snp.bottom).offset(-20)
            make.height.equalTo(48)
            make.width.equalTo(118)
        }
        
        giftDetailImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalTo(subTitleGiftLabel.snp.top).offset(-20)
            make.height.equalTo(giftDetailImage.snp.width).multipliedBy(0.7)
        }
        
        subTitleGiftLabel.snp.makeConstraints { make in
            make.top.equalTo(giftDetailImage.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        creditsLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-40)
            make.top.equalTo(subTitleGiftLabel.snp.bottom).offset(20)
        }
        
        creditsScoreLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(creditsLabel.snp.bottom).offset(12)
        }
        
        cointsImageView.snp.makeConstraints { make in
            make.left.equalTo(creditsScoreLabel.snp.right).offset(-8)
            make.top.equalTo(creditsLabel.snp.bottom).offset(20)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(subTitleGiftLabel.snp.bottom).offset(80)
        }
    
        descriptionBodyLabel.snp.makeConstraints { make in
            make.left.right.equalTo(giftDetailUseConteiner).inset(20)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
        }
        
    }
}
