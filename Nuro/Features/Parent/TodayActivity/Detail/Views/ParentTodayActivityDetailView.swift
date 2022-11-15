//
//  ParentTodayActivityDetailView.swift
//  Nuro
//
//  Created by Gregorius Albert on 24/10/22.
//

import UIKit

import UIKit

class ParentTodayActivityDetailView: UIView {
    
    var delegate: ParentTodayActivityDetailDelegate!
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = Colors.Neutral.bronze.cgColor
        view.layer.borderWidth = 0.5
        view.image = UIImage(named: "dummy")
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 24
        view.alignment = .leading
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        view.textColor = Colors.Text.onyx
        view.numberOfLines = 2
        view.text = "Rapihkan Kasur"
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.textColor = Colors.Text.onyx
        view.numberOfLines = 2
        view.text = "Kasurmu bersih dan rapih"
        return view
    }()
    
    func setup(vc: ParentTodayActivityDetailViewController, detail: AnyObject?) {
        backgroundColor = .white
        delegate = vc
        addMultipleSubviews(views: imageView, stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        setupNavigationBar(vc: vc)
        setupConstraints()
        
        imageView.image = Document.getImageFromDocument(imageURL: detail?.activity?.activityImageURL)
        titleLabel.text = detail?.activity?.activityName
        descriptionLabel.text = detail?.activity?.activityDesc
    }
    
    func setupNavigationBar(vc: ParentTodayActivityDetailViewController){
        vc.title = "Detil Aktivitas"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batal", style: .plain, target: self, action: #selector(dismissAction))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hapus", style: .done, target: self, action: #selector(deleteAction))
        vc.navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    @objc func dismissAction() {
        delegate.dismissViewController()
    }
    
    @objc func deleteAction() {
        delegate.deleteAction()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(64)
            make.left.equalTo(safeAreaLayoutGuide).inset(40)
            make.width.equalTo(ScreenSizes.modalWidth / 2)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(24)
            make.right.equalTo(self).inset(20)
        }
        
    }
    
}
