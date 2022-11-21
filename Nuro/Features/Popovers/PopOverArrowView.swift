//
//  PopOverArrowView.swift
//  Nuro
//
//  Created by Karen Natalia on 17/11/22.
//

import UIKit
import Instructions

class PopOverArrowView: UIView, CoachMarkArrowView {

    var isHighlighted: Bool = false

    private var arrowView = UIView()

    init(orientation: CoachMarkArrowOrientation) {
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(arrowView)
        arrowView.createDownArrowShape(width: 32, height: 20)
        
        arrowView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.width.equalTo(32)
            make.height.equalTo(20)
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding.")
    }
}
