//
//  UITableView+Ext.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/11/22.
//

import UIKit

extension UITableView {

    func setEmptyMessage(activate: Bool) {
        
        lazy var bottomLabel: UILabel = {
            let view = UILabel()
            view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)
            view.text = "Buka halaman rutinitas untuk menambahkan aktivitas harian"
            view.textColor = Colors.Text.onyx
            view.textAlignment = .center
            view.numberOfLines = 2
            return view
        }()
        
        lazy var stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.spacing = 20
            return view
        }()
        
        stackView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height)
        
        if activate {
            addSubview(stackView)
            stackView.addArrangedSubview(bottomLabel)
            let prefix = "Tekan tombol"
            let suffix = "untuk menambahkan aktivitas harian"
            
            let textAttachment = TextAttachments.iconOnly(imageName: Icons.plus, text: "", yOffset: -8, colorName: Colors.Brand.blueViolet)
            
            let str = NSMutableAttributedString(string: "")
            let attr = [NSAttributedString.Key.font : UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)]
            
            str.append(NSMutableAttributedString(string: "\(prefix)  "))
            str.append(NSMutableAttributedString(attributedString: textAttachment))
            str.append(NSMutableAttributedString(string: " Hari Ini", attributes: attr))
            str.append(NSMutableAttributedString(string: "\n\(suffix)"))
            
            bottomLabel.attributedText = str
        }
        
        else {
            stackView.removeFromSuperview()
            stackView.isHidden = true
        }
        

    }
}

