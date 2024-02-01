//
//  InfoView.swift
//  aviator

import Foundation
import UIKit

class InfoView: UIView {
    
    private lazy var backView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgroundsOne
        return imageView
    }()
    
    private(set) lazy var personBtn: UIButton = {
        let button = UIButton()
        button.setImage(.personBtn, for: .normal)
        return button
    }()

    private(set) var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Settings.appTitle)"
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .bold, size: 60)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum erat elit, egestas in massa id, pellentesque feugiat dolor. Quisque eu lacus non sem commodo lobortis. Curabitur porttitor nisi quam, et ornare neque egestas eget. Fusce quis pellentesque sapien. Aliquam sed ligula sagittis, porta mauris ac, facilisis dolor. Nam quis sagittis lacus. Vestibulum ultrices consectetur mauris, at consequat nisi mattis id. Suspendisse consequat iaculis turpis. Pellentesque convallis tortor vel tortor congue rhoncus. Suspendisse sed mi mattis, egestas urna in, aliquet nisl. Curabitur nec enim tincidunt, pellentesque tellus viverra, placerat enim. Donec vitae feugiat lorem. Ut eu rhoncus quam. Duis quam ligula, pulvinar rhoncus aliquam in, pharetra eu neque. Vivamus non mi ante. Praesent quis ligula sit amet est imperdiet finibus pharetra. Suspendisse potenti. Integer semper feugiat sapien, in viverra mauris pellentesque ac. Sed et semper nisl. Cras vulputate convallis orci pharetra consequat."
        label.textColor = .white
        label.font = UIFont.customFont(font: .mont, style: .regular, size: 16)
        label.numberOfLines = 0
        return label
    }()

    private(set) lazy var infoConteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .init(width: 0, height: 8)
        view.layer.shadowRadius = 14
        return view
    }()
    
    private(set) lazy var infoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.contentInset = UIEdgeInsets(top: 56, left: 0, bottom: -56, right: 0)
        return scrollView
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
        addSubview(infoScrollView)
        infoScrollView.addSubview(infoConteinerView)
        infoConteinerView.addSubview(subTitleLabel)
        infoConteinerView.addSubview(contentLabel)
        addSubview(personBtn)
        
    }
    
    private func setupConstraints() {
     
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        personBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().inset(56)
        }
        
        infoScrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.top.equalToSuperview()
        }
        
        infoConteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(60)
            make.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(40)
        }
    }
}
