//
//  AddNewVC.swift
//  aviator

import Foundation
import UIKit
import SnapKit

class AddNewVC: UIViewController {
    
    
    
    var contentView: AddNewView {
        view as? AddNewView ?? AddNewView()
    }
    
    override func loadView() {
        view = AddNewView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
