//
//  InfoVC.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class InfoVC: UIViewController {
    
    let auth = AuthService.shared
    
    var contentView: InfoView {
        view as? InfoView ?? InfoView()
    }
    
    override func loadView() {
        view = InfoView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
    }
    
    private func tappedButtons() {
        contentView.personBtn.addTarget(self, action: #selector(personTapped), for: .touchUpInside)
    }

    @objc func personTapped() {
        let profileVc = ProfileVC()
        profileVc.modalPresentationStyle = .fullScreen
        present(profileVc, animated: true)

    }
}
