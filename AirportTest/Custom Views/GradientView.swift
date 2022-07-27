//
//  GradientView.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 23/07/22.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    override class var layerClass: AnyClass { return CAGradientLayer.self }
    
    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }
    
    @IBInspectable var topColor: UIColor = .white { didSet { updateColors() } }
    @IBInspectable var bottomColor: UIColor = .blue { didSet { updateColors() } }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        updateColors()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateColors()
    }
    
    private func updateColors() {
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
