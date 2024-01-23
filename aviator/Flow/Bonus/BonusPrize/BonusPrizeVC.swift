//
//  BonusPrizeVC.swift
//  aviator

import UIKit
import SnapKit

class BonusPrizeVC: UIViewController {
    
    var total: Int = 0
    
    var contentView: BonusPrizeView {
        view as? BonusPrizeView ?? BonusPrizeView()
    }
    
    override func loadView() {
        view = BonusPrizeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
        configureLabel()
    }
    
    private func tappedButtons() {
        contentView.thanksButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    private func configureLabel() {
        contentView.scoreLifeLabel.text = "+\(total)\n Coints"
    }

    @objc func closeView() {
        UD.shared.lastBonusDate = Date()
        dismiss(animated: true)
    }
}
