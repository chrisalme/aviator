//
//  ReservationView.swift
//  aviator

import Foundation
import UIKit

class ReservationView: UIView {
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .cyan
    }
    
    private func setupConstraints() {
        
    }
}

