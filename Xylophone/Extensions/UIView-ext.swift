//
//  UIView-ext.swift
//  Xylophone
//
//  Created by macbook on 30.10.2023.
//

import Foundation
import UIKit

extension UIView {
    
    convenience init(backgroundColor: UIColor = .clear) {
        self.init()
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
