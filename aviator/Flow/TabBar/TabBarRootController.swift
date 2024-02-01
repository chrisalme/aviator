//
//  TabBarRootController.swift
//  aviator

import UIKit

class TabBarRootController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .customRed
        UITabBar.appearance().backgroundColor = .clear.withAlphaComponent(0.35)

        
        let reservVC = ReservationVC()
        buildConfig(reservVC, title: "Reservation", imageName: "reserv_Btn")
         
        
        let giftVC = GiftVC()
        let giftNavController = UINavigationController(rootViewController: giftVC)
        buildConfig(giftNavController, title: "Gift", imageName: "gift_Btn")
        
        let addNewVC = AddNewVC()
        let addNewNavController = UINavigationController(rootViewController: addNewVC)
        buildConfig(addNewNavController, title: "Events", imageName: "addNew_Btn")
        
        let bonusVC = BonusVC()
        let bonusNavController = UINavigationController(rootViewController: bonusVC)
        buildConfig(bonusNavController, title: "Bonus", imageName: "bonus_Btn")
        
        let infoVC = InfoVC()
        buildConfig(infoVC, title: "Info", imageName: "info_Btn")
        
        
        viewControllers = [reservVC,giftNavController,addNewNavController,bonusNavController,infoVC]
        
    }
    
    private func buildConfig(_ vc: UIViewController, title: String, imageName: String) {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 12)
    }
}
