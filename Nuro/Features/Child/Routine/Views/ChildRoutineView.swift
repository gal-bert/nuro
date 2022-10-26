//
//  ChildRoutineView.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

class ChildRoutineView: UIView {
    
    private lazy var activityCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        cv.backgroundColor = .clear
        return cv
    }()
    
    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Aktivitas XXXX"
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var startButton = ChildButton(title: "MULAI", height: ScreenSizes.halfScreenHeight / 4)
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    private lazy var stickView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Background.darkDeer
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var topStickView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Background.deer
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var parentButton = ParentModeButton(size: 80)
    
    private var delegate: ChildRoutineDelegate?
    
    func setup(vc: ChildRoutineViewController) {
        backgroundColor = .white
        delegate = vc
        
        setupUI()
        setupConstraints()
        setupCollectionView(vc: vc)
        setupButton()
    }
    
    private func setupUI() {
        addSubview(stickView)
        addSubview(stackView)
        addSubview(parentButton)
        stickView.addSubview(topStickView)
        stackView.addArrangedSubview(pageTitleLabel)
        stackView.addArrangedSubview(activityCollectionView)
        stackView.addArrangedSubview(startButton)
        
        // TODO: Set title "Aktivitas Pagi/Siang/Malem"
        pageTitleLabel.text = "Aktivitas Pagi"
    }
    
    private func setupConstraints() {
        stickView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(ScreenSizes.halfScreenWidth / 6)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 5)
            make.width.equalTo(ScreenSizes.screenWidth * 1.5)
        }
        
        topStickView.snp.makeConstraints { make in
            make.top.left.right.equalTo(stickView)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 5 - 12)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(64)
            make.left.right.equalTo(self)
        }
        
        activityCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(ScreenSizes.halfScreenHeight + 24)
        }
        
        startButton.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.screenWidth * 1 / 3)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
        
        parentButton.snp.makeConstraints { make in
            make.top.left.equalTo(64)
            make.width.height.equalTo(80)
        }
    }
    
    private func setupCollectionView(vc: ChildRoutineViewController) {
        activityCollectionView.dataSource = vc
        
        activityCollectionView.collectionViewLayout = collectionViewLayout()
        activityCollectionView.isUserInteractionEnabled = false
        
        activityCollectionView.register(ChildActivityCollectionViewCell.self, forCellWithReuseIdentifier: ChildActivityCollectionViewCell.identifier)
    }
    
    private func collectionViewLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(ScreenSizes.screenWidth * 2/3 - 16), heightDimension: .absolute(ScreenSizes.halfScreenHeight + 24)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 48
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func setupButton() {
        startButton.addTarget(self, action: #selector(startActivity), for: .touchUpInside)
    }
    
    @objc func startActivity() {
        delegate?.animateNextActivity()
        
        // TODO: Segue to full screen activity page
        // ..
    }
    
    func animateToNextActivity(totalActivity: Int, currTotalActivity: Int) {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: { [self] in
            animateDeleteRow()
            if totalActivity == currTotalActivity + 1 {
                animateStickStartMovement()
            }
            else if currTotalActivity == 1 {
                animateStickEndMovement()
            }
        }, completion: nil)
    }
    
    private func animateDeleteRow() {
        activityCollectionView.performBatchUpdates {
            activityCollectionView.deleteItems(at: [IndexPath(row: 0, section: 0)])
        }
    }
    
    func animateHideRow() {
        activityCollectionView.reloadItems(at: [IndexPath(row: 0, section: 0)])
    }
    
    private func animateStickStartMovement() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: { [self] in
            stickView.frame = CGRect(x: stickView.frame.origin.x - ScreenSizes.halfScreenWidth, y: stickView.frame.origin.y, width: stickView.frame.width, height: stickView.frame.height)
        }, completion: { [self] _ in
            stickView.snp.makeConstraints { make in
                make.left.equalTo(self).offset(-ScreenSizes.halfScreenWidth / 6)
            }
        })
    }
    
    private func animateStickEndMovement() {
        stickView.snp.removeConstraints()
        stickView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-ScreenSizes.halfScreenWidth / 6)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 6)
            make.width.equalTo(ScreenSizes.screenWidth * 2)
        }
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: { [self] in
            stickView.frame = CGRect(x: stickView.frame.origin.x - ScreenSizes.halfScreenWidth - (ScreenSizes.halfScreenWidth / 6), y: stickView.frame.origin.y, width: stickView.frame.width, height: stickView.frame.height)
        }, completion: nil)
    }
}

