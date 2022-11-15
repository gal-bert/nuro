//
//  ParentActivityTableViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 06/10/22.
//

import UIKit

class ParentTodayActivityTableViewCell: UITableViewCell {

    static let identifier = "parentActivityTableViewCell"
    var delegate: ParentTodayActivityDelegate!

    var routines = [MirrorDetail]()

    var cellBackgroundColor: UIColor?
    var timeframe: Int?
    var isViewingChildRoutine: Bool = false

    var timeframeLabel: UILabel = {
        let view = UILabel()
        view.text = "Pagi"
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        view.textColor = Colors.Text.onyx
        return view
    }()

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    var editButton = CellEditButton()

    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillProportionally
        return view
    }()
    
    var hiddenLabel: UILabel = {
        let view = UILabel()
        view.text = "Tidak ada aktivitas"
        view.isHidden = true
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 20)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.addArrangedSubview(timeframeLabel)
        stackView.addArrangedSubview(hiddenLabel)
        stackView.addArrangedSubview(editButton)

        contentView.addSubview(collectionView)

        backgroundColor = cellBackgroundColor

        layer.cornerRadius = 30

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ParentActivityCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityCollectionViewCell.identifier)

        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)

        setupConstraints()
    }

    func setupDelegate(vc: ParentTodayActivityViewController) {
        delegate = vc
    }


    @objc func editButtonAction() {
        let dest = ParentTodayActivityEditOrderViewController()
        dest.mirrorDetails = routines
        dest.editedTimeFrame = timeframe
        delegate.presentViewController(dest: dest, modalHeight: ScreenSizes.modalHeight)
    }


    private func setupConstraints() {

        stackView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(20)
        }

        editButton.snp.makeConstraints { make in
            make.width.equalTo(80)
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
        return routines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = ParentTodayActivityDetailViewController()
        dest.detail = routines[indexPath.item]
        delegate.presentViewController(dest: dest, modalHeight: ScreenSizes.smallModalHeight)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParentActivityCollectionViewCell.identifier, for: indexPath) as! ParentActivityCollectionViewCell
        cell.configure(model: routines[indexPath.item].activity ?? Activity())
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isViewingChildRoutine { // Parent Child Routine
            return CGSize(width: Int(ScreenSizes.halfScreenWidth * 2/5) + 24, height: Int(ScreenSizes.screenHeight) * 2/3 * 3/5)
        }
        else { // Parent Today Activity
            return CGSize(width: CollectionViewAttributes.collectionViewCellWidth, height: CollectionViewAttributes.collectionViewCellHeight)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 100)
    }
}
