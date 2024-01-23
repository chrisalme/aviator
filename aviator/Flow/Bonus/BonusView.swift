//
//  BonusView.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class BonusView: UIView {
    
    let segmentValues = [3, 5, 10, 2, 0, 15, 5, 7]
    private  var circles: [WheelView] = []
    private  let count = 8
    private let colors: [UIColor] = [.clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear]

    
    private(set)  var dailyBonusView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backDailyView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsBonus
        return imageView
    }()

    private(set) lazy var closeBtn: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.closeBtn, for: .normal)
        return button
    }()

    
    private(set) lazy var selectImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.arrow
        return image
    }()
    
    private(set) lazy var circleContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var circleImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.circleBonus
        image.clipsToBounds = true
        return image
    }()
    
    private(set) lazy var aviatorImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.flyStop
        return image
    }()
    
    private(set) lazy var goButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .customRed
        button.setTitle("Get bonus", for: .normal)
        button.titleLabel?.font = UIFont.customFont(font: .mont, style: .semiBold, size: 20)
        button.layer.cornerRadius = 20
        return button
    }()
    
//    private(set)  var timerView: UIView = {
//        let view = UIView()
//        view.isHidden = true
//        return view
//    }()
//    
//    private lazy var backTimerView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage.timerBackground
//        return imageView
//    }()
//    
//    private(set)  var titleTimeLabel: UILabel = {
//        let label = UILabel()
//        let attrString = CustomTextStyle.labelAttrString.attributedString(with: "Time to next bonus:")
//        label.attributedText = attrString
//        label.textColor = .yellow
//        label.textAlignment = .center
//        label.font = UIFont.customFont(font: .baloo, style: .regular, size: .h2)
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private(set) lazy var timecountLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .yellow
//        label.textAlignment = .center
//        label.font = UIFont.customFont(font: .baloo, style: .regular, size: .h8)
//        return label
//    }()
//    
//    private lazy var centerImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage.toy
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    
//    private(set) lazy var okBtn: UIButton = {
//        let button = UIButton()
//        button.setBackgroundImage(.backgroundButtons, for: .normal)
//        button.layer.cornerRadius = 30
//        let normalAttrString = CustomTextStyle.normalAttrString.attributedString(with: "OK")
//        let highlightedAttrString = CustomTextStyle.highlightedAttrString.attributedString(with: "OK")
//        button.setTitleColor(.white, for: .normal)
//        button.setAttributedTitle(normalAttrString, for: .normal)
//        button.setAttributedTitle(highlightedAttrString, for: .highlighted)
//
//        return button
//    }()
//    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBonusCircle()
        setupUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(dailyBonusView)
        dailyBonusView.addSubview(backDailyView)
        dailyBonusView.addSubview(goButton)
        dailyBonusView.addSubview(circleContainer)
        circleContainer.addSubview(circleImage)
        circleImage.addSubview(aviatorImage)
        dailyBonusView.addSubview(selectImageView)
//        addSubview(timerView)
//        timerView.addSubview(backTimerView)
//        timerView.addSubview(homeBtn)
//        timerView.addSubview(titleTimeLabel)
//        timerView.addSubview(timecountLabel)
//        timerView.addSubview(centerImage)
//        timerView.addSubview(okBtn)
        
    }
    
    private func setUpConstraints(){
        
        dailyBonusView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backDailyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        circleContainer.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(350)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(24)
        }
        
        circleImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        aviatorImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        selectImageView.snp.makeConstraints { (make) in
            make.top.equalTo(circleContainer.snp.top).offset(-28)
            make.centerX.equalToSuperview()
            make.size.equalTo(80)
        }
        
        goButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(188)
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-46)
        }
//        
//        timerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        backTimerView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        homeBtn.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(34)
//            make.left.equalToSuperview().offset(24)
//            make.size.equalTo(48)
//        }
//
//        titleTimeLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(homeBtn.snp.bottom).offset(32)
//        }
//        
//        timecountLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(titleTimeLabel.snp.bottom)
//        }
//        
//        centerImage.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(timecountLabel.snp.bottom).offset(72)
//            make.bottom.equalTo(okBtn.snp.top).offset(-72)
//        }
//        
//        okBtn.snp.makeConstraints { make in
//            make.left.right.equalToSuperview().inset(24)
//            make.height.equalTo(66)
//            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-52)
//        }
    }
    
    private func setupBonusCircle() {
        for index in 0..<count {
            let circle = WheelView(startAngle: CGFloat(Double(index) / Double(count) * 2 * Double.pi),
                                 endAngle: CGFloat(Double(index + 1) / Double(count) * 2 * Double.pi),
                                 color: colors[index % colors.count])
            circleContainer.addSubview(circle)
            circles.append(circle)
        }
        circles.forEach { circle in
            circle.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(10)
            }
        }
    }
}
