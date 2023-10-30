//
//  UIButton-ext.swift
//  Xylophone
//
//  Created by macbook on 30.10.2023.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(titleLabel: String = "", backroundColor: UIColor = .clear) {
        self.init()
        self.setTitle(titleLabel, for: .normal)
        self.backgroundColor = backroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addTargets(_ buttons: [UIButton], _ selector: Selector) {
        for button in buttons {
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
}
