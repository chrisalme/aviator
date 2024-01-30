//
//  DetailVC.swift
//  aviator


import Foundation
import UIKit

class DetailVC: UIViewController {
    
    var model: GiftsModel
    var uuid: String
    
    private var contentView: DetailView {
        view as? DetailView ?? DetailView()
    }
    
    init(model: GiftsModel, uuid: String) {
        self.model = model
        self.uuid = uuid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        setupBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true
    }
    
    
    private func configView() {
        contentView.giftDetailImage.image = UIImage(named: model.image)
        contentView.subTitleGiftLabel.text = model.title
        contentView.creditsScoreLabel.text = String(model.price)
        contentView.descriptionBodyLabel.text = model.description

    }
    
        func setupBackButton() {
        contentView.payHideButton.addTarget(self, action: #selector(showQRCode), for: .touchUpInside)
        contentView.closeBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showQRCode() {
        let codeVc = CodeVC()
        codeVc.id = model.id
        codeVc.modalPresentationStyle = .fullScreen
        present(codeVc, animated: true)
    }
    
    func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")
            
            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
                
                if let cgImage = CIContext().createCGImage(transformedImage, from: transformedImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        
        return nil
    }
}
