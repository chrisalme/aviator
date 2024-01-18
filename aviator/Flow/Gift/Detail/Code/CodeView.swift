//


import Foundation
import UIKit

class CodeView: UIView {

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
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var qrConteiner: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.alpha = 0.2
        view.addSubview(blurView)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.08).cgColor
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) lazy var hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
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
        addSubview(backView)
        addSubview(qrConteiner)
        addSubview(closeBtn)
        addSubview(titleGiftLabel)
        qrConteiner.addSubview(qrCodeImageView)
        qrConteiner.addSubview(hideButton)
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
        
        qrConteiner.snp.makeConstraints { make in
            make.top.equalTo(titleGiftLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview().offset(-56)
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(qrCodeImageView.snp.width)
        }
        
        hideButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(48)
            make.width.equalTo(118)
        }
    }
}
