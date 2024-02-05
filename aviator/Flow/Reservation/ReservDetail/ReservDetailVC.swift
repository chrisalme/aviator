//
//  ReservDetailVC.swift
//  aviator

import Foundation
import UIKit

class ReservDetailVC: UIViewController {
    
    var model: AddNewModel
    private var selectedButton: UIButton?
    private var seatID = ""
    private var idUser = UD.shared.userId
    
    
    private var contentView: ReservDetailView {
        view as? ReservDetailView ?? ReservDetailView()
    }
    
    init(model: AddNewModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = ReservDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
        contentView.setupReservations(reservations: model.reservations)
        setupButton()
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
        contentView.closeBtn.addTarget(self, action: #selector(buttonTappedClose), for: .touchUpInside)

    }
    
    @objc func buttonTappedClose() {
        navigationController?.popViewController(animated: true)
        
    }
}
