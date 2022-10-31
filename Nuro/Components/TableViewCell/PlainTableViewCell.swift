//
//  PlainTableViewCell.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

class PlainTableViewCell: UITableViewCell {
    
    static let identifier = "plainTableViewCell"
    
    lazy var cellLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.text = "Senin"
//        view.backgroundColor = .red
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        accessoryType = selected ? .checkmark : .none
    }
    
    private func setupView() {
        
        addSubview(cellLabel)
    }
    
    private func setupConstraints() {
        cellLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

}
