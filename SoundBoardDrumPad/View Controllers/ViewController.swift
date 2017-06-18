//
//  ViewController.swift
//  SoundBoardDrumPad
//
//  Created by Brady Bess on 5/13/17.
//  Copyright © 2017 Brady Bess. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, ChangeUIButtonColor {
    
    let allAudioTags = ["Casio Light Harp C3", "Casio Light Harp E", "Casio Light Harp Gb", "Alesis Piccolo C5", "E-Mu Thunder C1", "E-Mu Wacky Kick", "Kawai Bass C2", "Kawai Bass F2", "Bamboo Sound", "Clap", "Hip Hop Snare 1", "Dirty Bass", "8Bit Buzz", "Aluminum Reflector Bell", "Coin", "Flute Madness Loop", "Tinkles Synth Loop"]
    var audioTagsToPicker: Array<String> = []
    
    
    @IBOutlet weak var blueButton1: UIButton!
    @IBOutlet weak var blueButton2: UIButton!
    @IBOutlet weak var blueButton3: UIButton!
    //@IBOutlet weak var blueButton4: UIButton!
    @IBOutlet weak var greenButton1: UIButton!
    @IBOutlet weak var greenButton2: UIButton!
    @IBOutlet weak var greenButton3: UIButton!
    //@IBOutlet weak var greenButton4: UIButton!
    @IBOutlet weak var redButton1: UIButton!
    @IBOutlet weak var redButton2: UIButton!
    @IBOutlet weak var redButton3: UIButton!
    //@IBOutlet weak var redButton4: UIButton!
    @IBOutlet weak var purpleButton1: UIButton!
    @IBOutlet weak var purpleButton2: UIButton!
    @IBOutlet weak var purpleButton3: UIButton!
    //@IBOutlet weak var purpleButton4: UIButton!
    
    var player = AVAudioPlayer()
    var player2 = AVAudioPlayer()
    var player3 = AVAudioPlayer()
    var player4 = AVAudioPlayer()
    var player5 = AVAudioPlayer()
    var player6 = AVAudioPlayer()
    var oneIsPlaying = true
    var twoIsPlaying = false
    var threeIsPlaying = false
    var fourIsPlaying = false
    var fiveIsPlaying = false
    var sixIsPlaying = false
    var audio: String = " "
    
    override func viewDidLoad() {  //gets called once
        super.viewDidLoad()
        addDictionaryRefs()
        editButtonHasNotBeenPressed = false
        emptyAndFillArrays()
    }
    
    override func viewWillAppear(_ animated: Bool) { //gets called every time view appears
        changeEditButtonState()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var editButtonHasNotBeenPressed: Bool = false
    var colorToSend: String = " "
    var audioTagToSend: String = " "
    var buttonToChange: UIButton?
    @IBOutlet weak var editButton: UIButton!
    
    @IBAction func playAudio(_ sender: UIButton) {
        
        if editButtonHasNotBeenPressed {
            
            if oneIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player.play()
                oneIsPlaying = false
                twoIsPlaying = true
            }
                
            else if twoIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player2 = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player2.play()
                twoIsPlaying = false
                threeIsPlaying = true
            }
                
            else if threeIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player3 = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player3.play()
                threeIsPlaying = false
                fourIsPlaying = true
            }
                
            else if fourIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player4 = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player4.play()
                fourIsPlaying = false
                fiveIsPlaying = true
            }
                
            else if fiveIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player5 = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player5.play()
                fiveIsPlaying = false
                sixIsPlaying = true
            }
                
            else if sixIsPlaying {
                prepareAudio(tag: sender)
                do {
                    try player6 = AVAudioPlayer(contentsOf: (NSURL(fileURLWithPath: audio) as? URL)!)
                }
                catch {
                    print("error")
                }
                player6.play()
                sixIsPlaying = false
                oneIsPlaying = true
            }
        }
        else {
            audioTagToSend = tagAudioPairings[sender]!
            colorToSend = tagColorPairings[sender]!
            buttonToChange = sender
            performSegue(withIdentifier: "toSecondVC", sender: self)
        }
    }
    
    func prepareAudio(tag: UIButton) {
        
        audio = Bundle.main.path(forResource: tagAudioPairings[tag]!, ofType: "wav")!
        //return audio!
        
    }
    
    @IBOutlet weak var selectButton: UILabel!
    
    
    @IBAction func editButton(_ sender: UIButton) {
        
        changeEditButtonState()
        
    }
    
    func changeEditButtonState() {
        if editButtonHasNotBeenPressed {
            editButton.vanishAnimation()
            selectButton.appearAnimation()
            editButton.alpha = 0.0
            selectButton.alpha = 1.0
            editButtonHasNotBeenPressed = false
        }
        else {
            editButton.alpha = 1.0
            selectButton.alpha = 0.0
            editButtonHasNotBeenPressed = true
        }
    }
    
    func changeButtonColor(_ colorChange: String, audioToChange: String, buttonToChange: UIButton) {
        tagAudioPairings[buttonToChange] = audioToChange
        tagColorPairings[buttonToChange] = colorChange
        switch colorChange {
            case "Blue": buttonToChange.setImage(#imageLiteral(resourceName: "blue-glossy-button-blank-hi"), for: .normal)
            case "Green": buttonToChange.setImage(#imageLiteral(resourceName: "asia2Greenadd"), for: .normal)
            case "Red": buttonToChange.setImage(#imageLiteral(resourceName: "asia2Redadd"), for: .normal)
            case "Purple": buttonToChange.setImage(#imageLiteral(resourceName: "asia2add"), for: .normal)
        default: print("Error")
        }

    }
    
    var tagAudioPairings: Dictionary<UIButton, String> = [:]
    var tagColorPairings: Dictionary<UIButton, String> = [:]
    
    func addDictionaryRefs() {
        tagAudioPairings[blueButton1] = "Casio Light Harp C3"
        tagAudioPairings[blueButton2] = "Casio Light Harp E"
        tagAudioPairings[blueButton3] = "Casio Light Harp Gb"
        tagAudioPairings[greenButton1] = "Clap"
        tagAudioPairings[greenButton2] = "Hip Hop Snare 1"
        tagAudioPairings[greenButton3] = "Bamboo Sound"
        tagAudioPairings[redButton1] = "E-Mu Thunder C1"
        tagAudioPairings[redButton2] = "Kawai Bass F2"
        tagAudioPairings[redButton3] = "E-Mu Wacky Kick"
        tagAudioPairings[purpleButton1] = "Tinkles Synth Loop"
        tagAudioPairings[purpleButton2] = "Flute Madness Loop"
        tagAudioPairings[purpleButton3] = "Aluminum Reflector Bell"
        
        tagColorPairings[blueButton1] = "Blue"
        tagColorPairings[blueButton2] = "Blue"
        tagColorPairings[blueButton3] = "Blue"
        tagColorPairings[greenButton1] = "Green"
        tagColorPairings[greenButton2] = "Green"
        tagColorPairings[greenButton3] = "Green"
        tagColorPairings[redButton1] = "Red"
        tagColorPairings[redButton2] = "Red"
        tagColorPairings[redButton3] = "Red"
        tagColorPairings[purpleButton1] = "Purple"
        tagColorPairings[purpleButton2] = "Purple"
        tagColorPairings[purpleButton3] = "Purple"

    }
    
    func filterArray() { //takes out tags that are already being used
        for element in tagAudioPairings {
            if let index = audioTagsToPicker.index(of: element.value) {
                audioTagsToPicker.remove(at: index)
            }
        }
    }
    
    func emptyAndFillArrays() {
        audioTagsToPicker.removeAll(keepingCapacity: false)
        audioTagsToPicker = allAudioTags
        filterArray()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            if let destinationVC = segue.destination as? EditorViewController {
                emptyAndFillArrays()
                destinationVC.stringAudioTag = audioTagToSend
                destinationVC.colorToDisplay = colorToSend
                destinationVC.button = buttonToChange
                destinationVC.audioToPickFrom = audioTagsToPicker
                destinationVC.delegate1 = self
            }
        }
    }
}

