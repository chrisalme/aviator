//
//  ReservationVC.swift
//  aviator


import Foundation
import UIKit

class ReservationVC: UIViewController {
    
    var items = [AddNewModel]()
    private let auth = AuthService.shared
    private let getService = GetService.shared

    
    var contentView: ReservationView {
        view as? ReservationView ?? ReservationView()
    }
    
    override func loadView() {
        view = ReservationView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkingWelcome()
        print("USERID - \(UD.shared.userId)")
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadModel()

    }

    private func checkingWelcome() {
        let isFirstLaunch = UD.isFirstLaunch()
        if isFirstLaunch {
            let vc = WelcomeVC()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }

    private func configureTableView() {
        contentView.reservTableView.dataSource = self
        contentView.reservTableView.delegate = self
        contentView.reservTableView.separatorStyle = .none
    }
    
    func loadModel() {
        getService.fetchReserved { [weak self] reservEvent in
            guard let self = self else { return }
            self.items = reservEvent
            self.contentView.reservTableView.reloadData()
        } errorCompletion: { [weak self] error in
            guard self != nil else { return }
            
        }
    }
}

extension ReservationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReservCell.reuseId, for: indexPath)
        
        guard let addNewCell = cell as? ReservCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        addNewCell.setupCell(item: item)
        
        return addNewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let reservDetailVC = ReservDetailVC(model: item)
        reservDetailVC.model = item
        reservDetailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(reservDetailVC, animated: true)
        
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
          
            let titleLabel = UILabel()
            titleLabel.text = "Reservation".uppercased()
            titleLabel.font = UIFont.customFont(font: .mont, style: .bold, size: 40)
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white
            titleLabel.frame = headerView.bounds
            
            headerView.addSubview(titleLabel)
            
            return headerView
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 60.0
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Reservation"
        }
}
