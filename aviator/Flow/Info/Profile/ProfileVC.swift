//
//  ProfileVC.swift
//  aviator

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    private let imagePicker = UIImagePickerController()
    
    
    private var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerConfigure()
        savedName()
        tappedButtons()
    }
    
    private func imagePickerConfigure() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false

    }
    
    private func savedName() {
         if !UD.shared.isNotFirst {
             UD.shared.isNotFirst = true
         }
         if let savedUserName = UD.shared.userName {
             contentView.profileTextField.text = savedUserName
         }
    }
    
    private func tappedButtons() {
        contentView.closeBtn.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        contentView.profileBtn.addTarget(self, action: #selector(goTakePhoto), for: .touchUpInside)
    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }

    @objc func goTakePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alert = UIAlertController(title: "Pick Photo", message: nil, preferredStyle: .actionSheet)
            let action1 = UIAlertAction(title: "Camera", style: .default) { _ in
                self.imagePicker.sourceType = .camera
            }
            let action2 = UIAlertAction(title: "photo library", style: .default) { _ in
                self.imagePicker.sourceType = .photoLibrary
            }
            let cancel = UIAlertAction(title: "cancel", style: .cancel)
            present(imagePicker, animated: true, completion: nil)
            alert.addAction(action1)
            alert.addAction(action2)
            alert.addAction(cancel)
            present(alert, animated: true)
        } else {
            print("Камера недоступна")
        }
    }
    
}

extension ProfileVC: UIImagePickerControllerDelegate {
    
    func saveImageToLocal(image: UIImage) {
        if let data = image.jpegData(compressionQuality: 1.0) {
            let fileURL = getDocumentsDirectory().appendingPathComponent("\(UD.shared.userId).png")
            do {
                try data.write(to: fileURL)
            } catch {
                print("Error saving image to local storage: \(error)")
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func getImageFromLocal() -> UIImage? {
        let fileURL = getDocumentsDirectory().appendingPathComponent("\(UD.shared.userId).png")
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            print("Error loading image from local storage: \(error)")
            return nil
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.profileBtn.setImage(image, for: .normal)
            saveImageToLocal(image: image)
        }
        
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ProfileVC: UINavigationControllerDelegate {
    
}
