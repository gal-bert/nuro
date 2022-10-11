//
//  ParentActivityFolderTableViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 10/10/22.
//

import UIKit

class ParentActivityFolderTableViewCell: UITableViewCell {

    static let identifier = "parentActivityFolderTableViewCell"
    
    private lazy var collectionViewFolder: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionViewFolder)
        
        backgroundColor = .orange
        
        collectionViewFolder.delegate = self
        collectionViewFolder.dataSource = self
        collectionViewFolder.register(ParentActivityFolderCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier)
        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionViewFolder.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(20)
            make.left.right.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ParentActivityFolderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionViewFolder: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewFolder.dequeueReusableCell(withReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier, for: indexPath) as! ParentActivityFolderCollectionViewCell
//        cell.configure(with: routines!.activities[indexPath.item])
//        cell.setImage(image: "dummy")
        return cell
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.COLLECTION_VIEW_CELL_WIDTH, height: CollectionViewAttributes.COLLECTION_VIEW_CELL_HEIGHT)
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 100)
    }
}
