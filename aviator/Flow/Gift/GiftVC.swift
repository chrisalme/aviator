//
//  GiftVC.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class GiftVC: UIViewController {
    
    var items = [GiftsModel]()

    var contentView: GiftView {
        view as? GiftView ?? GiftView()
    }
    
    let service = TestBeck.shared

    
    override func loadView() {
        view = GiftView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadModel()
    }
    
    private func configureTableView() {
        contentView.giftAviatorTableView.dataSource = self
        contentView.giftAviatorTableView.delegate = self
        contentView.giftAviatorTableView.separatorStyle = .none
    }
    
    func loadModel() {
        service.readFromGiftsData{ [weak self] models in
            guard let self = self else { return }
            self.items = models
            self.contentView.giftAviatorTableView.reloadData()
        } errorComletion: { error in
            print("Error")
        }
    }
}

extension GiftVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GiftCell.reuseId, for: indexPath)
        
        guard let giftCell = cell as? GiftCell else {
            return cell
        }
        
        let item = items[indexPath.row]
        
        giftCell.setupCell(item: item)
        
        return giftCell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        
        let detailVC = DetailVC(model: item, uuid: item.id)
        
        detailVC.model = item
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 60))
            headerView.backgroundColor = .clear
          
            let titleLabel = UILabel()
            titleLabel.text = "Gifts".uppercased()
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
            return "Gift"
        }
}
