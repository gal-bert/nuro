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
    
    func textViewDidChange(_ textView: UITextView) {
        createActivityView.validateEmptyField(vc: self)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Strings.emptyDescTextViewPlaceHolder
            textView.textColor = Colors.Neutral.bronze
        }
        
        createActivityView.validateEmptyField(vc: self)
    }
    
}

extension CreateActivityViewController: CreateActivityDelegate {
    func pushViewController(dest: UIImagePickerController, type:UIImagePickerController.SourceType) {
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
        if (navigationController?.viewControllers.count ?? 0) > 1 {
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            self.dismiss(animated: true)
        }
    }
    
    func saveActivity() {
        ActivityLocalRepository.shared.add(
            name: createActivityView.nameTextField.text ?? "",
            desc: createActivityView.descTextArea.text ?? "",
            imageURL: Document.saveToDocument(image: createActivityView.selectImageSelector.imageView.image),
            to: category ?? Category()
        )
        
        delegate?.reloadData()
        let activities = ActivityLocalRepository.shared.getActivitiesOfCategory(category: category ?? Category())
        addActivityDelegate?.addActivityToRoutine(activity: activities[activities.count - 1])
        
        dismissViewController()
    }
    
    func validateFields() {
        createActivityView.validateEmptyField(vc: self)
    }
    
}

extension CreateActivityViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
//        createActivityView.selectImageSelector.backgroundColor = UIColor(patternImage: image)
        createActivityView.selectImageSelector.imageView.image = image
        
        createActivityView.selectImageSelector.stackView.removeFromSuperview()
        createActivityView.validateEmptyField(vc: self)
    }
}
