//
//  ReservationVC.swift
//  aviator


import Foundation
import UIKit

class ReservationVC: UIViewController {
    
    
    
    var contentView: ReservationView {
        view as? ReservationView ?? ReservationView()
    }
    
    override func loadView() {
        view = ReservationView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
