//
//  UIStackView-ext.swift
//  Xylophone
//
//  Created by macbook on 30.10.2023.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    convenience init(axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     aligment: UIStackView.Alignment,
                     distribution: UIStackView.Distribution,
                     addArrangeSubVeiws: [UIView]) {
        self.init(arrangedSubviews: addArrangeSubVeiws)
        self.axis = axis
        self.spacing = spacing
        self.alignment = aligment
        self.distribution = distribution
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
}

