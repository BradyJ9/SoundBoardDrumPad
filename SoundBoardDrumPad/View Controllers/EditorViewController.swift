//
//  EditorViewController.swift
//  SoundBoardDrumPad
//
//  Created by Brady Bess on 5/15/17.
//  Copyright © 2017 Brady Bess. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController, passColorBackDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var currentTagLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //data sent to
    var stringAudioTag: String = " "
    var colorToDisplay: String = " "
    var button: UIButton?
    var audioToPickFrom: Array<String> = []
    
    //data sent back
    var delegate1: ChangeUIButtonColor?
    var colorToSendBack: String = " "
    var audioToSendBack: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        colorToSendBack = colorToDisplay
        audioToSendBack = stringAudioTag
        pickerView.delegate = self
        pickerView.dataSource = self
        
        switch colorToDisplay {
            case "Blue": imageToSet.image = #imageLiteral(resourceName: "blue-glossy-button-blank-hi")
            case "Green": imageToSet.image = #imageLiteral(resourceName: "asia2Greenadd")
            case "Red": imageToSet.image = #imageLiteral(resourceName: "asia2Redadd")
            case "Purple": imageToSet.image = #imageLiteral(resourceName: "asia2add")
        default: print("error")
            
        }
        
        currentTagLabel.text = "Current Audio: \(stringAudioTag) "
        
        print(colorToSendBack)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToRootViewController(_ sender: UIButton) {
        
        delegate1?.changeButtonColor(colorToSendBack, audioToChange: (audioToSendBack)!, buttonToChange: (button)!)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var imageToSet: UIImageView!
    
    func changeColorImage(colorChange: String) {
        switch colorChange {
        case "Blue": imageToSet.image = #imageLiteral(resourceName: "blue-glossy-button-blank-hi")
        case "Green": imageToSet.image = #imageLiteral(resourceName: "asia2Greenadd")
        case "Red": imageToSet.image = #imageLiteral(resourceName: "asia2Redadd")
        case "Purple": imageToSet.image = #imageLiteral(resourceName: "asia2add")
        default: print("error")
        }
    }
    
    func colorToChange(_ color: String) {
        colorToSendBack = color
        changeColorImage(colorChange: color)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Modal" {
            if let destinationVC = segue.destination as? ModalViewController {
                destinationVC.delegate = self
                
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return audioToPickFrom.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentTagLabel.text = "Current Audio: \(audioToPickFrom[row]) "
        audioToSendBack = audioToPickFrom[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let string = NSAttributedString(string: audioToPickFrom[row], attributes: [NSForegroundColorAttributeName : UIColor.white])
        return string
    }
    
    

}
