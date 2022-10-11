//
//  ParentActivityTableViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 06/10/22.
//

import UIKit

class ParentTodayActivityTableViewCell: UITableViewCell {
    
    static let identifier = "parentActivityTableViewCell"
    
    var cellBackgroundColor: UIColor?
    var timeframe: Int?
    
    var timeframeLabel: UILabel = {
        let view = UILabel()
        view.text = "Pagi"
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        view.textColor = .black
        return view
    }()

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        contentView.addSubview(timeframeLabel)
        contentView.addSubview(collectionView)
        
        backgroundColor = cellBackgroundColor

        layer.cornerRadius = 30
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ParentActivityCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityCollectionViewCell.identifier)
        
        setupConstraints()
    }

    
    private func setupConstraints() {
        
        timeframeLabel.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(timeframeLabel.snp.bottom).offset(20)
            make.bottom.equalTo(self).inset(25)
            make.left.right.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ParentTodayActivityTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParentActivityCollectionViewCell.identifier, for: indexPath) as! ParentActivityCollectionViewCell
//        cell.configure(with: routines!.activities[indexPath.item])
//        cell.setImage(image: "dummy")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.collectionViewCellWidth, height: CollectionViewAttributes.collectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 100)
    }
}
