//
//  CreateActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit

extension CreateActivityViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == Colors.Neutral.bronze {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Ketik kalimat reward singkat untuk anak saat menyelesaikan aktivitas..."
            textView.textColor = Colors.Neutral.bronze
        }
    }
    
}

extension CreateActivityViewController: CreateActivityDelegate {
    func pushViewController(dest: UIImagePickerController, type:UIImagePickerController.SourceType) {
        dest.allowsEditing = true
        dest.sourceType = type
        dest.delegate = self
        present(dest, animated: true)
    }
    
    func pushSelectorAlert() {
        let alert = UIAlertController(title: "Masukkan Gambar", message: "Pilih cara memasukkan gambar", preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "Ambil Foto",
            style: .default,
            handler: { _ in
                self.pushViewController(dest: UIImagePickerController(), type: .camera)
            }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Pilih Foto",
            style: .default,
            handler: { _ in
                self.pushViewController(dest: UIImagePickerController(), type: .photoLibrary)
            }
        ))
        
        alert.addAction(UIAlertAction(
            title: "Batalkan",
            style: .cancel,
            handler: nil
        ))
        
        present(alert, animated: true)
        
    }
    
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func saveActivity() {
        // TODO: Insert to core data
        dismissViewController()
    }
    
}

extension CreateActivityViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
//        createActivityView.selectImageSelector.backgroundColor = UIColor(patternImage: image)
        createActivityView.selectImageSelector.imageView.image = image
        
        createActivityView.selectImageSelector.stackView.removeFromSuperview()
    }
}
