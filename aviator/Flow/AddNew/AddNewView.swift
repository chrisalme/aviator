//
//  AddNewView.swift
//  aviator

import Foundation
import UIKit

class AddNewView: UIView {
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .green
    }
    
    private func setupConstraints() {
        
    }
}
