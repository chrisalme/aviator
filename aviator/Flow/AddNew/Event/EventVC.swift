//
//  EventVC.swift
//  aviator
//

import Foundation
import UIKit

class EventVC: UIViewController {
    
    var model: AddNewModel
    private var selectedButton: UIButton?
    private var seatID = ""
    private var idUser = UD.shared.userId
    
    
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
        contentView.circleBtns.forEach{ $0.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)}
        contentView.reservedBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.closeBtn.addTarget(self, action: #selector(buttonTappedClose), for: .touchUpInside)

    }
    
    @objc func circleButtonTapped(_ target: UIButton) {
        let res = model.reservations.first(where: {$0.seat == target.tag})
        let yellowButtons = contentView.circleBtns.filter { $0.backgroundColor == .yellow }
        if yellowButtons.count >= 1 && target.backgroundColor == .green {
            showAlert(message: "You can't pick two places")
            return
        }
        
        if target.backgroundColor == UIColor.red {
            showAlertError(message: "The place is busy")
            return
        } else if target.backgroundColor == UIColor.yellow {
            showAlert(message: "You have already chosen this place")
            return
        }
        
        if let previousButton = selectedButton {
            previousButton.backgroundColor = res?.status.color
        }
        
        selectedButton = target
        target.backgroundColor = .blue
        guard let res = res else { return }
        seatID = res.id
        print("UserID - \(res.userID) id - \(res.id)")
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showAlertError(message: String) {
        let alertController = UIAlertController(title: "Sorry", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonTappedClose() {
        navigationController?.popViewController(animated: true)
        
    }

    @objc func buttonTapped() {
        fetchReserv()
        navigationController?.popViewController(animated: true)
        
    }
    
    private func fetchReserv() {
        let urlString = "https://aviatorgame-backend-6ff168b0f620.herokuapp.com/api/events/reservation/\(seatID)/\(idUser)"
        print("User ID - \(idUser)")
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            guard let token = AuthService.shared.token else { return }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let httpResponse = response as? HTTPURLResponse,
                          (200..<300).contains(httpResponse.statusCode) {
                    // Обработь успешный ответ
                    if data != nil {
                        print("Response")
                    }
                } else {
                    print("Unexpected response: \(response?.description ?? "")")
                }
            }.resume()
        } else {
            print("Invalid URL")
        }
    }
}
