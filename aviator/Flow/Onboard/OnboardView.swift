//
//  OnboardView.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class OnboardView: UIView {
        

    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.backgroundsWelcome
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var loadLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading...".uppercased()
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 24)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
 
    private(set) lazy var loadView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressViewStyle = .bar
        progressView.progress = 0.0
        progressView.progressTintColor = .customRed
        return progressView
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
        [backView,loadLabel,loadView] .forEach(addSubview(_:))
    }
            
    private func setUpConstraints(){
        
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        
        loadLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-100)
            make.centerX.equalToSuperview()
        }

        loadView.snp.makeConstraints { (make) in
            make.top.equalTo(loadLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.width.equalTo(126)
        }
    }
}
