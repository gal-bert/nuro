//
//  ChildActivityView.swift
//  Nuro
//
//  Created by Karen Natalia on 26/10/22.
//

import UIKit

class ChildActivityView: UIView {

    private lazy var activityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var labelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Text.verseGreen.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var activityName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 40)
        label.text = "Activity Name"
        label.textAlignment = .center
        label.textColor = Colors.Neutral.white
        return label
    }()
    
    private lazy var doneButton = ChildButton(title: "Aku sudah selesai", height: ScreenSizes.halfScreenHeight / 4)
    
    private var delegate: ChildActivityDelegate?
    
    func setup(model: Activity, vc: ChildActivityViewController) {
        delegate = vc
        
        setupButton()
        setupUI()
        setupConstraints()
        setupValue(model: model)
    }
    
    private func setupButton() {
        doneButton.addTarget(self, action: #selector(activityCompleted), for: .touchUpInside)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        addSubview(activityImage)
        addSubview(labelContainer)
        addSubview(doneButton)
        labelContainer.addSubview(activityName)
    }
    
    private func setupConstraints() {
        activityImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
        
        activityName.snp.makeConstraints { make in
            make.center.equalTo(labelContainer)
        }
        
        doneButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(64)
            make.centerX.equalTo(self)
            make.width.equalTo(ScreenSizes.halfScreenWidth)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
    }
    
    private func setupValue(model: Activity) {
        activityImage.image = UIImage(data: model.activityImage ?? Data())
        activityName.text = model.activityName
    }
    
    @objc func activityCompleted() {
        delegate?.toActivityCompleted()
    }

}
