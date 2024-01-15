//
//  BonusView.swift
//  aviator

import Foundation
import UIKit

class BonusView: UIView {
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .orange
    }
    
    private func setupConstraints() {
        
    }
}
