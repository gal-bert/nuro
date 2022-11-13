//
//  ParentTodayActivityEmptyStateView.swift
//  Nuro
//
//  Created by Gregorius Albert on 16/10/22.
//

import UIKit

class ParentTodayActivityEmptyStateView: UIView {
    
    private lazy var topLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)
        view.text = "Tidak ada aktivitas tersedia."
        view.textColor = Colors.Text.onyx
        view.textAlignment = .center
        return view
    }()
    
    private lazy var bottomLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)
        view.text = "Buka halaman rutinitas untuk menambahkan aktivitas harian"
        view.textColor = Colors.Text.onyx
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
                
        addSubview(stackView)
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(bottomLabel)
        let prefix = "Buka halaman"
        let suffix = "untuk menambahkan aktivitas harian"
        
        let textAttachment = TextAttachments.iconOnly(imageAsset: Icons.today, text: "", yOffset: -8, colorName: Colors.Brand.blueViolet)
        
        let str = NSMutableAttributedString(string: "")
        let attr = [NSAttributedString.Key.font : UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)]
        
        str.append(NSMutableAttributedString(string: "\(prefix)  "))
        str.append(NSMutableAttributedString(attributedString: textAttachment))
        str.append(NSMutableAttributedString(string: " Hari Ini", attributes: attr))
        str.append(NSMutableAttributedString(string: "\n\(suffix)"))
        
        bottomLabel.attributedText = str
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
        }
    }
    
}


