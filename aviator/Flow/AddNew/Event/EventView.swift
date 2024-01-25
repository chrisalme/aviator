//
//  EventView.swift
//  aviator
//

import Foundation
import UIKit

class EventView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var titleEventLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
        return label
    }()
    
    private lazy var dateContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.backgroundColor = .white.withAlphaComponent(0.18)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var nameContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.backgroundColor = .white.withAlphaComponent(0.18)
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Date"
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var dateScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 16)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 16)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 20)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var reservedBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Reserved", for: .normal)
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
        
        [backView,titleEventLabel,dateContainer,nameContainer,reservedBtn] .forEach(addSubview(_:))
        
        
        dateContainer.addSubview(dateLabel)
        dateContainer.addSubview(timeLabel)
        dateContainer.addSubview(dateScoreLabel)
        nameContainer.addSubview(nameLabel)

        
    }
    private func setupConstraints() {
   
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleEventLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(36)
            make.centerX.equalToSuperview()
        }
        
        dateContainer.snp.makeConstraints { make in
            make.top.equalTo(titleEventLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(40)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(dateLabel.snp.right).offset(40)
        }
        
        dateScoreLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeLabel.snp.right).offset(44)
        }
        
        nameContainer.snp.makeConstraints { make in
            make.top.equalTo(dateContainer.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(40)
        }
        
        reservedBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
}
