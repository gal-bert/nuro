//
//  CircleImage.swift
//  Nuro
//
//  Created by Karen Natalia on 11/10/22.
//

import UIKit

class CircleImage: UIImageView {

    required init(size: CGFloat, imageName: String) {
        super.init(frame: .zero)
        
        self.image = UIImage(systemName: imageName)
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = size / 2
        self.backgroundColor = .red
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
