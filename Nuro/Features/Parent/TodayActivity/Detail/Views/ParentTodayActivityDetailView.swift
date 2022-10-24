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
        view.image = UIImage(named: "dummy")
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .center
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
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 32)
        view.textColor = Colors.Text.onyx
        view.numberOfLines = 2
        view.text = "Kasurmu bersih dan rapih"
        return view
    }()
    
    func setup(vc: ParentTodayActivityDetailViewController) {
        backgroundColor = .white
        delegate = vc
        addMultipleSubviews(views: imageView, stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        setupNavigationBar(vc: vc)
        setupConstraints()
        
        imageView.image = UIImage(data: vc.routineDetail?.activity?.activityImage ?? Data())
        titleLabel.text = vc.routineDetail?.activity?.activityName
        descriptionLabel.text = vc.routineDetail?.activity?.activityDesc
        
    }
    
    func setupNavigationBar(vc: ParentTodayActivityDetailViewController){
        vc.title = "Aktivitas Pagi"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(dismissAction))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hapus", style: .plain, target: self, action: #selector(deleteAction))
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
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(80)
            make.left.equalTo(safeAreaLayoutGuide).inset(40)
            make.width.equalTo(imageView.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(20)
            make.right.equalTo(self).inset(20)
        }
        
    }
    
}
