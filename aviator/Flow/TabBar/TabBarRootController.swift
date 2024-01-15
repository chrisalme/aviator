//
//  TabBarRootController.swift
//  aviator

import UIKit

class TabBarRootController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .red
        UITabBar.appearance().backgroundColor = .clear.withAlphaComponent(0.08)
        
        
        let reservVC = ReservationVC()
        buildConfig(reservVC, title: "Reservation", imageName: "reserv_Btn")
         
        
        let giftVC = GiftVC()
        let giftNavController = UINavigationController(rootViewController: giftVC)
        buildConfig(giftNavController, title: "Gift", imageName: "gift_Btn")
        
        let addNewVC = AddNewVC()
        buildConfig(addNewVC, title: "+", imageName: "addNew_Btn")
        
        let bonusVC = BonusVC()
        let bonusNavController = UINavigationController(rootViewController: bonusVC)
        buildConfig(bonusNavController, title: "Bonus", imageName: "bonus_Btn")
        
        let infoVC = InfoVC()
        buildConfig(infoVC, title: "Info", imageName: "info_Btn")
        
        
        viewControllers = [reservVC,giftNavController,addNewVC,bonusNavController,infoVC]
        
    }
    
    private func buildConfig(_ vc: UIViewController, title: String, imageName: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
    }
}
