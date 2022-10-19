//
//  HeaderTimeframeSection.swift
//  Nuro
//
//  Created by Samuel Dennis on 18/10/22.
//

import UIKit

class HeaderTimeframeSection: UITableViewHeaderFooterView {
    
    static let identifier = "headerTimeframeSection"

    var timeframeLabel: UILabel = {
        let view = UILabel()
        view.text = "Pagi"
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        view.textColor = Colors.Text.onyx
        return view
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(timeframeLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        timeframeLabel.snp.makeConstraints { make in
            make.left.equalTo(self).inset(20)
        }
    }
    
    

}
