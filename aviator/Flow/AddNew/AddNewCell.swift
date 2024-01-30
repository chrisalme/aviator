//
//  AddNewCell.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class AddNewCell: UITableViewCell {
    
    static let reuseId = String(describing: AddNewCell.self)

    
    private(set) lazy var addNewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.08)
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.text = "Game"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        return label
    }()

    private lazy var gameScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 20)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var timeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        return label
    }()

    private lazy var dateScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        return label
    }()

    private lazy var placesLabel: UILabel = {
        let label = UILabel()
        label.text = "Total places:"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var placesScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        return label
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

        contentView.addSubview(addNewContainer)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 8)
        contentView.layer.shadowRadius = 12
        backgroundColor = .clear
        selectionStyle = .none
        
        [gameLabel,gameScoreLabel,dateLabel,dateScoreLabel,timeScoreLabel,placesLabel,placesScoreLabel].forEach(addNewContainer.addSubview(_:))
        
    }
    
    func setupConstraints() {
        addNewContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.right.bottom.equalToSuperview()
        }
        
        gameLabel.snp.makeConstraints { make in
            make.left.equalTo(addNewContainer).offset(20)
            make.top.equalTo(addNewContainer).offset(33)
            make.height.equalTo(20)
        }
        
        gameScoreLabel.snp.makeConstraints { make in
            make.centerX.equalTo(addNewContainer)
            make.top.equalTo(addNewContainer).offset(33)
            make.height.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(addNewContainer).offset(20)
            make.top.equalTo(gameLabel.snp.bottom).offset(20)
        }
        
        dateScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.right).offset(40)
            make.top.equalTo(gameLabel.snp.bottom).offset(20)
        }

        timeScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(dateScoreLabel.snp.right).offset(40)
            make.top.equalTo(gameLabel.snp.bottom).offset(20)
        }
        
        placesLabel.snp.makeConstraints { make in
            make.left.equalTo(addNewContainer).offset(20)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-33)
        }
        
        placesScoreLabel.snp.makeConstraints { make in
            make.left.equalTo(placesLabel.snp.right).offset(40)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        gameScoreLabel.text = nil
        dateScoreLabel.text = nil
        timeScoreLabel.text = nil
    }
    
    func setupCell(item: AddNewModel) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributedText = NSAttributedString(string: item.event, attributes: underlineAttribute)
//        gameScoreLabel.attributedText = attributedText
//        dateScoreLabel.text = item.startData
//        timeScoreLabel.text = item.duration
//        placesScoreLabel.text = String(item.reservations.count)
    }
}
