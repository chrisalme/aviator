//
//  EventVC.swift
//  aviator
//

import Foundation
import UIKit

class EventVC: UIViewController {
    
    var model: AddNewModel
    
    private var contentView: EventView {
        view as? EventView ?? EventView()
    }
    
    init(model: AddNewModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = EventView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    private func configView() {
        contentView.titleEventLabel.text = model.event
        contentView.dateScoreLabel.text = model.startData
        contentView.timeLabel.text = model.duration
    }
        func setupBackButton() {

            contentView.reservedBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }

}