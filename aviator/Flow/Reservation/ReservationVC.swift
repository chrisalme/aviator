//
//  ReservationVC.swift
//  aviator


import Foundation
import UIKit

class ReservationVC: UIViewController {
    
    private let auth = AuthService.shared

    
    var contentView: ReservationView {
        view as? ReservationView ?? ReservationView()
    }
    
    override func loadView() {
        view = ReservationView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateAndCheckToken()
    }
    
    private func authenticateAndCheckToken() {
        Task {
            do {
                try await auth.authenticate()
                checkToken()
            } catch {
                print("Authentication failed. Error: \(error)")
            }
        }
    }

    private func checkToken() {
        guard let token = auth.token else {
            return
        }
        print("TOKEN - \(token)")
    }
}
