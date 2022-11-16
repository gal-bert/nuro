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
        view.backgroundColor = Colors.Text.verseGreen.withAlphaComponent(0.8)
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
        
        Transition.smoothAnimationBlack(subviews: subviews)
    }
    
    private func setupButton() {
        doneButton.addTarget(self, action: #selector(activityCompleted), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)
        doneButton.addTarget(self, action: #selector(animateDown), for: .touchDown)
    }
    
    private func setupUI() {
        backgroundColor = .black
        
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
        activityImage.image = Document.getImageFromDocument(imageURL: model.activityImageURL)
        activityName.text = model.activityName
    }

    @objc func animateUp(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 1.0, scaleY: 1.0) {

        }
    }

    @objc func animateDown(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 0.9, scaleY: 0.9, withAudio: true) {

        }
    }
    
    @objc func activityCompleted() {
        MicroInteractions.shrinkAndGrow(button: doneButton, scaleX: 1.0, scaleY: 1.0) {
            self.delegate?.toActivityCompleted()
        }
    }

}
