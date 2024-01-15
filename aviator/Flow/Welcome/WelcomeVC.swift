//
//  WelcomeVC.swift
//  aviator


import Foundation
import UIKit

class WelcomeVC: UIViewController {
        
        var uD: UD = .shared
        
        var balanse: Int {
            get {
                return uD.balance
            }
            set {
                uD.balance = newValue
            }
        }
        
        private var contentView: WelcomeView {
            view as? WelcomeView ?? WelcomeView()
        }
        
        override func loadView() {
            view = WelcomeView()
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            tappedButtons()
        }
        
        private func tappedButtons() {
            contentView.thankButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        }
        @objc func buttonTapped() {
            balanse += 100
            Settings.points = balanse
            dismiss(animated: true)

        }
        
    }
