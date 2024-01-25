//
//  AddNewVC.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class AddNewVC: UIViewController {
    
    var items = [AddNewModel]()
    

    var contentView: AddNewView {
        view as? AddNewView ?? AddNewView()
    }
    
    let service = TestBeck.shared

    
    override func loadView() {
        view = AddNewView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadModel()
    }
    
    private func configureTableView() {
        contentView.eventTableView.dataSource = self
        contentView.eventTableView.delegate = self
        contentView.eventTableView.separatorStyle = .none
    }
    
    func loadModel() {
        service.readFromAddNewData{ [weak self] models in
            guard let self = self else { return }
            self.items = models
            self.contentView.eventTableView.reloadData()
        } errorComletion: { error in
            print("Error")
        }
    }
}

extension AddNewVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddNewCell.reuseId, for: indexPath)
        
        guard let addNewCell = cell as? AddNewCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        addNewCell.setupCell(item: item)
        
        return addNewCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let eventVC = EventVC(model: item)
        eventVC.model = item
        eventVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(eventVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
          
            let titleLabel = UILabel()
            titleLabel.text = "Events".uppercased()
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
            return "Events"
        }
}
