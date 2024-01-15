//
//  GiftVC.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class GiftVC: UIViewController {
    
    
    
    var contentView: GiftView {
        view as? GiftView ?? GiftView()
    }
    
    override func loadView() {
        view = GiftView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
