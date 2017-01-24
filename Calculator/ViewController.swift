//
//  ViewController.swift
//  Calculator
//
//  Created by Bobby Hamrick & Alex Louzao on 1/23/17.
//  Copyright © 2017 Bobby Hamrick & Alex Louzao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //delcare all of the buttons on the calculator
    @IBOutlet var displayLabel: UILabel!
    
    
    //func displayOne(UIButton)
    //When the 0 button is pushed, display a 0 on the displayLabel
    @IBAction func displayZero(_ sender: UIButton){
        displayLabel.text = "0"
    }
    
    //func displayOne(UIButton)
    //When the 1 button is pushed, display a 1 on the displayLabel
    @IBAction func displayOne(_ sender: UIButton){
        displayLabel.text = "1"
    }
    
    //func displayTwo(UIButton)
    //When the 2 button is pushed, display a 2 on the displayLabel
    @IBAction func displayTwo(_ sender: UIButton){
        displayLabel.text = "2"
    }
    
    //func displayThree(UIButton)
    //When the 3 button is pushed, display a 3 on the displayLabel
    @IBAction func displayThree(_ sender: UIButton){
        displayLabel.text = "3"
    }
    
    //func displayFour(UIButton)
    //When the 4 button is pushed, display a 4 on the displayLabel
    @IBAction func displayFour(_ sender: UIButton){
        displayLabel.text = "4"
    }
    
    //func displayFive(UIButton)
    //When the 5 button is pushed, display a 5 on the displayLabel
    @IBAction func displayFive(_ sender: UIButton){
        displayLabel.text = "5"
    }
    
    //func displaySix(UIButton)
    //When the 6 button is pushed, display a 6 on the displayLabel
    @IBAction func displaySix(_ sender: UIButton){
        displayLabel.text = "6"
    }
    
    //func displaySeven(UIButton)
    //When the 7 button is pushed, display a 7 on the displayLabel
    @IBAction func displaySeven(_ sender: UIButton){
        displayLabel.text = "7"
    }
    
    //func displayEight(UIButton)
    //When the 8 button is pushed, display a 8 on the displayLabel
    @IBAction func displayEight(_ sender: UIButton){
        displayLabel.text = "8"
    }
    
    //func displayNine(UIButton)
    //When the 9 button is pushed, display a 9 on the displayLabel
    @IBAction func displayNine(_ sender: UIButton){
        displayLabel.text = "9"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

