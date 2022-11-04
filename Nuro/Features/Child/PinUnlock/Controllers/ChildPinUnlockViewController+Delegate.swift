//
//  ChildPinUnlockViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 31/10/22.
//

import Foundation
import UIKit

extension ChildPinUnlockViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.item == 10 {
            viewModel.pin.append(0)
            childPinUnlockView.updatePinTextField(count: viewModel.pin.count, newInput: 0)
        }
        else {
            viewModel.pin.append(indexPath.item + 1)
            childPinUnlockView.updatePinTextField(count: viewModel.pin.count, newInput: indexPath.item + 1)
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
            if viewModel.pin.count == 4 {
                if viewModel.checkPin() {
                    self.dismiss(animated: true)
                }
                else {
                    let alert = Alert.infoAlert(title: "Pin Incorrect", message: "Please insert the correct pin number to move to parents mode")
                    self.present(alert, animated: true)
                }
                childPinUnlockView.clearTextFields()
            }
        }
    }
}

extension ChildPinUnlockViewController: ChildPinUnlockViewDelegate {
    func deleteLastPin() {
        if viewModel.removeLastPin() {
            childPinUnlockView.clearLastPin(count: viewModel.pin.count)
        }
    }
    
    func dismissPage() {
        Transition.animateTransition(vc: self)
        navigationController?.popViewController(animated: false)
    }
}
