//
//  OnboardVC.swift
//  aviator

import Foundation
import UIKit

class OnboardVC: UIViewController {
    
    private var timer: Timer?
    private let auth = AuthService.shared

    private var contentView: OnboardView {
        view as? OnboardView ?? OnboardView()
    }
    
    override func loadView() {
        view = OnboardView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateAndCheckToken()
        animaPB()
    }
    
    func presentHomeScreen() {
        let vc = TabBarRootController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    private func authenticateAndCheckToken() {
        Task {
            do {
                try await auth.authenticate()
                checkToken()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.presentHomeScreen()
                }
            } catch {
                print("Authentication failed. Error: \(error)")
                presentHomeScreen()
            }
        }
    }

    private func checkToken() {
        guard let token = auth.token else {
            return
        }
    }

    func animaPB() {
        UIView.animate(withDuration: 3.5) {
            self.contentView.loadView.setProgress(1.0, animated: true)
        }
    }
}
