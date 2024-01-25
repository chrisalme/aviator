//
//  GiftCell.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class GiftCell: UITableViewCell {
    
    static let reuseId = String(describing: GiftCell.self)

    
    private(set) lazy var giftDetailUseConteiner: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.08)
        view.layer.cornerRadius = 8
        return view
    }()

    private lazy var coinsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private(set) lazy var giftImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private lazy var cointsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .aviatorCoins
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 24 , bottom: 0, right: 24))
        }
    
    func setupUI(){

        contentView.addSubview(giftDetailUseConteiner)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 8)
        contentView.layer.shadowRadius = 14
        backgroundColor = .clear
        selectionStyle = .none
        
        [giftImage,titleLabel,cointsImageView,coinsLabel].forEach(giftDetailUseConteiner.addSubview(_:))
        
    }
    
    func setupConstraints() {
        giftDetailUseConteiner.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.right.bottom.equalToSuperview()
        }
        
        giftImage.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalTo(giftImage.snp.right).offset(28)
        }
        
        coinsLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(giftImage.snp.right).offset(28)
        }
        
        cointsImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.left.equalTo(coinsLabel.snp.right).offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        coinsLabel.text = nil
        titleLabel.text = nil
        giftImage.image = nil
    }
    
    func setupCell(item: GiftsModel) {
        coinsLabel.text = item.price
        titleLabel.text = item.title
        giftImage.image = UIImage(named: item.imageGifts)
    }
}
