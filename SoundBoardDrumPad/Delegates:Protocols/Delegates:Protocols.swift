//
//  Delegates:Protocols.swift
//  SoundBoardDrumPad
//
//  Created by Brady Bess on 5/21/17.
//  Copyright © 2017 Brady Bess. All rights reserved.
//

import Foundation
import UIKit


protocol passColorBackDelegate {
    func colorToChange(_ color: String)
}

protocol ChangeUIButtonColor {
    func changeButtonColor(_ colorChange: String, audioToChange: String, buttonToChange: UIButton)
}

extension UIButton {
    
    func vanishAnimation() {
        
        let vanish = CABasicAnimation(keyPath: "opacity")
        vanish.duration = 0.6
        vanish.fromValue = 1.0
        vanish.toValue = 0.0
        vanish.autoreverses = false
        
        layer.add(vanish, forKey: nil)
        
        
    }
    
}

extension UILabel {
    
    func appearAnimation() {
        
        let appear = CABasicAnimation(keyPath: "opacity")
        appear.duration = 0.6
        appear.fromValue = 0.0
        appear.toValue = 1.0
        appear.autoreverses = false
        
        layer.add(appear, forKey: nil)
    }
    
    
}
