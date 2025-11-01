//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    private var isDone : Bool = true
    
    private var displayValue : Double {
        get {
            guard let num = Double(displayLabel.text!) else { fatalError("Cannot convert to Double")}
            return num
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = Calculator()
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isDone = true
        if let method = sender.currentTitle {
            calculator.setValue(displayValue)
            guard let calculationResult = calculator.calculate(method) else {fatalError("Calculation failed.")}
            displayValue = calculationResult
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad

        if let text = sender.currentTitle  {
            if !isDone {
                if text == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += text
            }
            else {
                displayLabel.text = text
                isDone = false
            }
        }

    }

}

