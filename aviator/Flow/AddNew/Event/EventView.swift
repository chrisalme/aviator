//
//  EventView.swift
//  aviator
//

import Foundation
import UIKit

class EventView: UIView {
    
    private(set) var circleBtns: [UIButton] = []
    private var reservations: [EventReservation] = []
    
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
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
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
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.18).cgColor
        view.backgroundColor = .white.withAlphaComponent(0.18)
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Date"
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        label.numberOfLines = 0
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
    
    private(set) lazy var dateScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        label.numberOfLines = 0
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
    
    private(set) lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nameScoreContainer: UIView = {
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
    
    private(set) lazy var nameScoreLabel: UILabel = {
        let label = UILabel()
        label.text = "\(UD.shared.userName ?? "userName")"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var backTableView: UIView = {
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
    
    private(set) lazy var tableView: UIView = {
        let view = UIView()
        view.backgroundColor = .customDarkRed
        view.layer.cornerRadius = 40
        return view
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
    
    private(set) lazy var infoBtnRes: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        return button
    }()
    
    private(set) lazy var redLabel: UILabel = {
        let label = UILabel()
        label.text = " - Seat reserved"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 10)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var infoBtnMyRes: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 5
        return button
    }()
    
    private(set) lazy var yellowLabel: UILabel = {
        let label = UILabel()
        label.text = " - Your reservation"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 10)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var infoBtnFree: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        return button
    }()
    
    private(set) lazy var greenLabel: UILabel = {
        let label = UILabel()
        label.text = " - Free seat"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .semiBold, size: 10)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var closeBtn: UIButton = {
        let button = UIButton()
        button.setImage(.closeBtn, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        adjustFontSizesForScreenSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        [backView,closeBtn,titleEventLabel,dateContainer,nameContainer,reservedBtn,backTableView] .forEach(addSubview(_:))
        backTableView.addSubview(tableView)
        backView.addSubview(infoBtnFree)
        backView.addSubview(greenLabel)
        backView.addSubview(infoBtnRes)
        backView.addSubview(redLabel)
        backView.addSubview(infoBtnMyRes)
        backView.addSubview(yellowLabel)
        createButtons()
        dateContainer.addSubview(dateScoreContainer)
        dateContainer.addSubview(dateLabel)
        dateContainer.addSubview(timeContainer)
        timeContainer.addSubview(timeLabel)
        dateScoreContainer.addSubview(dateScoreLabel)
        nameContainer.addSubview(nameLabel)
        nameContainer.addSubview(nameScoreContainer)
        nameScoreContainer.addSubview(nameScoreLabel)
        
    }
    
    private func createButtons() {
        for i in 0..<10 {
            let circleBtn = UIButton()
            circleBtn.backgroundColor = .green
            circleBtn.frame.size.width = 28
            circleBtn.frame.size.height = 28
            circleBtn.layer.cornerRadius = 14
            circleBtn.layer.masksToBounds = false
            circleBtn.tag = i
            addSubview(circleBtn)
            circleBtns.append(circleBtn)
        }
    }
    
    func setupReservations(reservations: [EventReservation]) {
        for i in 0..<reservations.count {
            let reservation = reservations[i]
            switch reservation.status {
            case .free:
                circleBtns[i].backgroundColor = .green
            case .reserved:
                circleBtns[i].backgroundColor = .red
            case .reservedByMe:
                if reservation.userID == UD.shared.userId {
                    circleBtns[i].backgroundColor = .yellow
                    
                }else {
                    circleBtns[i].backgroundColor = .red
                }
            }
        }
    }
    
    private func setupConstraints() {
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        closeBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalToSuperview().inset(56)
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
        
        timeContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview().offset(-8)
            make.width.equalTo(128)
            make.height.equalTo(40)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        dateScoreContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(timeContainer.snp.right).offset(4)
            make.width.equalTo(98)
            make.height.equalTo(40)
        }
        
        dateScoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
        
        nameScoreContainer.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.width.equalTo(128)
            make.height.equalTo(40)
        }
        
        nameScoreLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backTableView.snp.makeConstraints { make in
            make.top.equalTo(nameContainer.snp.bottom).offset(69)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(reservedBtn.snp.top).offset(-69)
        }
        
        tableView.snp.makeConstraints { make in
            make.centerY.equalTo(backTableView).offset(-24)
            make.centerX.equalTo(backTableView)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        infoBtnFree.snp.makeConstraints { make in
            make.left.equalTo(backTableView).offset(24)
            make.bottom.equalTo(backTableView).offset(-12)
            make.height.equalTo(15)
            make.width.equalTo(10)
        }
        
        greenLabel.snp.makeConstraints { make in
            make.left.equalTo(infoBtnFree).offset(12)
            make.bottom.equalTo(backTableView).offset(-14)
        }
        
        infoBtnRes.snp.makeConstraints { make in
            make.left.equalTo(greenLabel.snp.right).offset(10)
            make.bottom.equalTo(backTableView).offset(-12)
            make.height.equalTo(15)
            make.width.equalTo(10)
        }
        
        redLabel.snp.makeConstraints { make in
            make.left.equalTo(infoBtnRes).offset(12)
            make.bottom.equalTo(backTableView).offset(-14)
        }
        
        infoBtnMyRes.snp.makeConstraints { make in
            make.left.equalTo(redLabel.snp.right).offset(10)
            make.bottom.equalTo(backTableView).offset(-12)
            make.height.equalTo(15)
            make.width.equalTo(10)
        }
        
        yellowLabel.snp.makeConstraints { make in
            make.left.equalTo(infoBtnMyRes).offset(12)
            make.bottom.equalTo(backTableView).offset(-14)
        }
        
        reservedBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
        for (index, circleBtn) in circleBtns.enumerated() {
            circleBtn.snp.makeConstraints { make in
                make.centerX.equalTo(tableView).offset(142 * cos(CGFloat(index) * 2 * CGFloat.pi / 10))
                make.centerY.equalTo(tableView).offset(92 * sin(CGFloat(index) * 2 * CGFloat.pi / 10))
            }
        }
    }
    
    private func adjustFontSizesForScreenSize() {
        let screenSize = UIScreen.main.bounds
        let smallerScreenHeight: CGFloat = 812
        
        if screenSize.height < smallerScreenHeight {
            reservedBtn.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo(160)
                make.height.equalTo(48)
                make.bottom.equalToSuperview().offset(-24)
            }
            
            backTableView.snp.makeConstraints { make in
                make.top.equalTo(nameContainer.snp.bottom).offset(8)
                make.left.right.equalToSuperview().inset(20)
                make.bottom.equalToSuperview().offset(-128)
            }
        }
    }
}
