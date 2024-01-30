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
        setupButton()
        contentView.setupReservations(reservations: model.reservations)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    private func configView() {
        contentView.titleEventLabel.text = model.event
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let startDateString = "2024-02-09T10:34:42Z"
        
        if let startDate = dateFormatter.date(from: startDateString) {
            var hourComponent = DateComponents()
            hourComponent.hour = model.duration
            if let hoursLater = Calendar.current.date(byAdding: hourComponent, to: startDate) {
                let timeScoreLabelOneHourLater = DateFormatter.localizedString(from: hoursLater, dateStyle: .none, timeStyle: .short)
                
                let dateScoreLabelOne = DateFormatter.localizedString(from: startDate, dateStyle: .short, timeStyle: .none)
                let timeScoreLabelOne = DateFormatter.localizedString(from: startDate, dateStyle: .none, timeStyle: .short)
                
                contentView.dateScoreLabel.text = String(dateScoreLabelOne)
                contentView.timeLabel.text = ("\(timeScoreLabelOne) - \(timeScoreLabelOneHourLater)")
                
            } else {
                print("Ошибка при разборе даты")
            }
        }
    }
        func setupButton() {
            contentView.circleBtns.forEach{ $0.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)}
            contentView.reservedBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func circleButtonTapped(_ target: UIButton) {
        let res = model.reservations.first(where: {$0.seat == target.tag})
        guard let res = res else { return }
        print("TAPPED - \(res.seat)")
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }

}
