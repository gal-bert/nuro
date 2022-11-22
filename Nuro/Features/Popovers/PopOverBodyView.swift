//
//  RoutinePopOverView.swift
//  Nuro
//
//  Created by Karen Natalia on 17/11/22.
//

import UIKit
import Instructions

class PopOverBodyView: UIView, CoachMarkBodyView {

    var nextControl: UIControl? { return self.nextButton }
    var highlighted: Bool = false
    weak var highlightArrowDelegate: CoachMarkBodyHighlightArrowDelegate?

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        label.text = "Walkthrough Title"
        label.textColor = Colors.Neutral.white
        return label
    }()
    
    var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 20)
        label.text = "Walkthrough Subtitle"
        label.textColor = Colors.Neutral.white
        label.numberOfLines = 5
        return label
    }()
    
    var nextButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.tintColor = Colors.Neutral.white
        button.setTitle("Berikutnya", for: .normal)
        button.setTitleColor(Colors.Brand.blueViolet, for: .normal)
        return button
    }()
    
    var emptyView = UIView()

    override init (frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(title: String, subtitle: String, buttonTitle: String) {
        self.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.Brand.blueViolet
        self.clipsToBounds = true
        self.layer.cornerRadius = 15

        addMultipleSubviews(views: titleLabel, subTitleLabel, nextButton, emptyView)
        setupConstraints()
        
        titleLabel.text = title
        subTitleLabel.text = subtitle
        
        let font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 20)
        let attributedTitle = NSAttributedString(string: buttonTitle, attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Brand.blueViolet])
        nextButton.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding.")
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(16)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(140)
            make.right.bottom.equalTo(self).inset(16)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(40)
        }
        
        emptyView.snp.makeConstraints { make in
            make.left.bottom.equalTo(self).inset(16)
            make.width.equalTo(300)
            make.height.equalTo(40)
            make.right.equalTo(nextButton.snp.left)
        }
    }

}
