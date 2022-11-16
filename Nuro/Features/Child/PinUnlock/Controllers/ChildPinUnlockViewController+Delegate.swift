//
//  ChildPinUnlockViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 31/10/22.
//

import Foundation
import UIKit

extension ChildPinUnlockViewController: UICollectionViewDelegate {

    // touchUpOutside
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell()
        MicroInteractions.shrinkAndGrow(button: cell, scaleX: 1.0, scaleY: 1.0, duration: 0.05, completion: {

        })
    }

    // touchDown
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell()
        MicroInteractions.shrinkAndGrow(button: cell, scaleX: 0.9, scaleY: 0.9, duration: 0.05, completion: {

        })
    }

    // touchUpInside
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) ?? UICollectionViewCell()
        MicroInteractions.shrinkAndGrow(button: cell, scaleX: 1.0, scaleY: 1.0, duration: 0.05, completion: {

        })
        
        if viewModel.pin.count < 4 {
            if indexPath.item == 10 {
                viewModel.pin.append(0)
                childPinUnlockView.updatePinTextField(count: viewModel.pin.count, newInput: 0)
            } else {
                viewModel.pin.append(indexPath.item + 1)
                childPinUnlockView.updatePinTextField(count: viewModel.pin.count, newInput: indexPath.item + 1)
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
            if viewModel.pin.count == 4 {
                if viewModel.checkPin() {
                    UserDefaults.standard.set(false, forKey: UserDefaultsHelper.Keys.isLocked)
                    self.dismiss(animated: true)
                }
                else {
                    let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
                    shake.values = [0, 20, -20, 0]
                    shake.duration = 0.25
                    shake.repeatCount = 1

                    childPinUnlockView.pinStackView.layer.add(shake, forKey: "shake")

//                    let alert = Alert.infoAlert(title: "PIN Salah", message: "Masukkan tahun lahir antara \(Pin.minimumYear) hingga \(Pin.maximumYear)")
//                    self.present(alert, animated: true)
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
    
    func showHint() {
        let dest = PinUnlockPopOverViewController()
        dest.modalPresentationStyle = .popover

        dest.popoverPresentationController?.sourceView = childPinUnlockView.hintButton
        dest.popoverPresentationController?.permittedArrowDirections = .left
        dest.preferredContentSize = CGSize(width: ScreenSizes.screenWidth / 3, height: ScreenSizes.screenHeight / 4)

        self.present(dest, animated: true)
    }
}
