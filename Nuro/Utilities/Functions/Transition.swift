//
//  Transition.swift
//  Nuro
//
//  Created by Karen Natalia on 04/11/22.
//

import UIKit

class Transition {
    
    enum DelayTime {
        static let slightDelay = 1.0
        static let fullDelay = 1.6
    }
    
    static func animateTransition(vc: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.type = .fade
        vc.view.window?.layer.add(transition, forKey: nil)
    }

    static func animateTransition(vc: UIViewController, transitionType: CATransitionType, transitionSubtype: CATransitionSubtype) {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.type = transitionType
        transition.subtype = transitionSubtype
        vc.view.window?.layer.add(transition, forKey: nil)
    }
    
    static func smoothAnimationWhite(view: UIView, subviews: [UIView], bgColor: UIColor) {
        view.backgroundColor = .black
        
        for subview in subviews {
            subview.alpha = 0
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5) {
            view.backgroundColor = bgColor
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.8) {
            for subview in subviews {
                subview.alpha = 1
            }
        }
    }
    
    static func smoothAnimationWithDelay(view: UIView, subviews: [UIView], bgColor: UIColor, delayForViews: [UIView], delayTime: Double) {
        view.backgroundColor = .black
        
        for subview in subviews {
            subview.alpha = 0
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5) {
            view.backgroundColor = bgColor
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.8) {
            for subview in subviews {
                subview.alpha = 1
                
                for delayed in delayForViews {
                    delayed.alpha = 0
                }
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: delayTime) {
            for delayed in delayForViews {
                delayed.alpha = 1
            }
        }
    }
    
    static func smoothAnimationBlack(subviews: [UIView]) {
        for subview in subviews {
            subview.alpha = 0
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.5) {
            for subview in subviews {
                subview.alpha = 1
            }
        }
    }
    
}
