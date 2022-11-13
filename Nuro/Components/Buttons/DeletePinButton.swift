//
//  DeletePinButton.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

class DeletePinButton: UIButton {
    
    private lazy var buttonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Icons.cancel, withConfiguration: UIImage.SymbolConfiguration(pointSize: 26, weight: .black))
        imageView.tintColor = Colors.Neutral.white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(width: CGFloat, height: CGFloat, type: UIButton.ButtonType = .custom) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        addCustomShapeLayer(width: width, height: height)
        addButtonImage(width: width)
    }
    
    private func addCustomShapeLayer(width: CGFloat, height: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = Colors.Brand.blueViolet.cgColor
        shapeLayer.path = createCustomPath(width: width, height: height)
        shapeLayer.position = CGPoint(x: 0, y: 0)
        
        self.layer.addSublayer(shapeLayer)
    }
    
    private func createCustomPath(width: CGFloat, height: CGFloat) -> CGPath {
        let point1 = CGPoint(x: 0, y: height / 2)
        let point2 = CGPoint(x: width * 1/3, y: 0)
        let point3 = CGPoint(x: width, y: 0)
        let point4 = CGPoint(x: width, y: height)
        let point5 = CGPoint(x: width * 1/3, y: height)
        
        let path = CGMutablePath()
        let radius = 12.0
        
        path.move(to: point5)
        path.addArc(tangent1End: point1, tangent2End: point2, radius: radius)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
        path.addArc(tangent1End: point4, tangent2End: point5, radius: radius)
        path.addArc(tangent1End: point5, tangent2End: point1, radius: radius)
        path.closeSubpath()
        
        return path
    }
    
    private func addButtonImage(width: CGFloat) {
        self.addSubview(buttonImage)
        buttonImage.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self).offset(width * 1/9)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.7 : 1.0
        }
    }
}
