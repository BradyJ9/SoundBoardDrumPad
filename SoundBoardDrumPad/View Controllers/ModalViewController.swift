//
//  ModalViewController.swift
//  SoundBoardDrumPad
//
//  Created by Brady Bess on 5/21/17.
//  Copyright © 2017 Brady Bess. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class SubView: UIView {

}

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 10
        myView.layer.masksToBounds = true
        
    }
    
    @IBOutlet weak var blueColorButton: UIButton!
    @IBOutlet weak var purpColorButton: UIButton!
    @IBOutlet weak var redColorButton: UIButton!
    @IBOutlet weak var greenColorButton: UIButton!
    
    @IBOutlet weak var myView: SubView!
    var colorToChangeTo: String = " "
    
    var delegate: passColorBackDelegate?
    
    @IBAction func changeColor(_ sender: UIButton) {
        switch sender {
        case blueColorButton: colorToChangeTo = "Blue"
        case redColorButton: colorToChangeTo = "Red"
        case greenColorButton: colorToChangeTo = "Green"
        case purpColorButton: colorToChangeTo = "Purple"
        default: print("error")
        }
        delegate?.colorToChange(colorToChangeTo)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //print("Hello")
    }
    
    
}
