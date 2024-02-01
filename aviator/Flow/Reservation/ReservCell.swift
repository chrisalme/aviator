//
//  ReservCell.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class ReservCell: UITableViewCell {
    
    static let reuseId = String(describing: ReservCell.self)
    
    
    private(set) lazy var reservEventContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        view.backgroundColor = .white.withAlphaComponent(0.08)
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
    
    private lazy var timeContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        view.backgroundColor = .white.withAlphaComponent(0.08)
        return view
    }()

    private lazy var timeScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        return label
    }()
    
    private lazy var dateScoreContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        view.backgroundColor = .white.withAlphaComponent(0.08)
        return view
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
    
    private lazy var placeScoreContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 68
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        view.backgroundColor = .white.withAlphaComponent(0.08)
        return view
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
        
        contentView.addSubview(reservEventContainer)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .init(width: 0, height: 8)
        contentView.layer.shadowRadius = 12
        backgroundColor = .clear
        selectionStyle = .none
        
        [gameLabel,gameScoreLabel,dateLabel,dateScoreContainer,timeContainer,placesLabel,placeScoreContainer].forEach(reservEventContainer.addSubview(_:))
        timeContainer.addSubview(timeScoreLabel)
        dateScoreContainer.addSubview(dateScoreLabel)
        placeScoreContainer.addSubview(placesScoreLabel)
    }
    
    func setupConstraints() {
        reservEventContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.right.bottom.equalToSuperview()
            make.width.equalTo(353)
            make.height.equalTo(200)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.left.equalTo(reservEventContainer).offset(20)
            make.top.equalTo(reservEventContainer).offset(33)
            make.height.equalTo(20)
        }
        
        gameScoreLabel.snp.makeConstraints { make in
            make.centerX.equalTo(reservEventContainer)
            make.top.equalTo(reservEventContainer).offset(33)
            make.height.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.left.equalTo(reservEventContainer).offset(20)
            make.centerY.equalToSuperview()
        }
        
        timeContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(128)
            make.height.equalTo(40)
        }
        
        timeScoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        dateScoreContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeContainer.snp.right).offset(8)
            make.width.equalTo(96)
            make.height.equalTo(40)
        }
        
        dateScoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        placesLabel.snp.makeConstraints { make in
            make.left.equalTo(reservEventContainer).offset(20)
            make.bottom.equalToSuperview().offset(-33)
        }
        
        placeScoreContainer.snp.makeConstraints { make in
            make.left.equalTo(placesLabel.snp.right).offset(20)
            make.top.equalTo(dateScoreContainer.snp.bottom).offset(20)
            make.width.equalTo(48)
            make.height.equalTo(40)
        }
        
        placesScoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
        gameScoreLabel.attributedText = attributedText
        placesScoreLabel.text = String(item.reservations.count)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let startDateString = "2024-02-09T10:34:42Z"
        
        if let startDate = dateFormatter.date(from: startDateString) {
            var hourComponent = DateComponents()
            hourComponent.hour = item.duration
            if let hoursLater = Calendar.current.date(byAdding: hourComponent, to: startDate) {
                let timeScoreLabelOneHourLater = DateFormatter.localizedString(from: hoursLater, dateStyle: .none, timeStyle: .short)
                
                let dateScoreLabelOne = DateFormatter.localizedString(from: startDate, dateStyle: .short, timeStyle: .none)
                let timeScoreLabelOne = DateFormatter.localizedString(from: startDate, dateStyle: .none, timeStyle: .short)
                
                dateScoreLabel.text = String(dateScoreLabelOne)
                timeScoreLabel.text = ("\(timeScoreLabelOne) - \(timeScoreLabelOneHourLater)")
                
            } else {
                print("Ошибка при разборе даты")
            }
        }
    }
}
