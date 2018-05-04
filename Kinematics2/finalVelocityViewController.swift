//
//  finalVelocityViewController.swift
//  WorldTrotter
//
//  Created by Joshua Nielson on 9/1/17.
//  Copyright © 2017 Joshua Nielson. All rights reserved.
//

import UIKit

class finalVelocityViewController:
UIViewController, UITextFieldDelegate {
    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var accelerationTextField: UITextField!
    @IBOutlet var initialVelocityTextField: UITextField!
    @IBOutlet var finalVelocityLabel: UILabel!
    @IBOutlet var solveButton: UIButton!
    
    var finalVelocityValue: Double? {
        if let time = timeTextField.text, let acceleration = accelerationTextField.text, let initialVelocity = initialVelocityTextField.text, let dT = Double(time), let A = Double(acceleration), let Vi = Double(initialVelocity) {
            return Vi + A * dT
        }
        else{
            return nil
        }
    }
    
    
    func updateAnswerLabel(){
        if let finalVelocityValue = finalVelocityValue{
            finalVelocityLabel.text = numberFormatter.string(from: NSNumber(value: finalVelocityValue))
        }
        else{
            finalVelocityLabel.text = "Error1"
        }
    }
    
    
    
    // This is the rule that says no more than one decimal in an input.
    @objc(textField:shouldChangeCharactersInRange:replacementString:) func textField(_ timeTextField: UITextField,
                                                                                     shouldChangeCharactersIn range: NSRange,
                                                                                     replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = timeTextField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    // This prints to the console
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("finalVelocityViewController loaded its view")
        
    }
    
    // This is the formatter that allows how many decimals to round to.
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()
    
    // runs the updateAnswerLabel function when Solve is clicked
    @IBAction func solveButtonPressed (_ solveButton: UIButton){
        // if the button is pressed, take the 3 arguments and solve the equation, putting the results in Vf label.
        updateAnswerLabel()
        
    }
    
    
    // Get rid of keyboard, duh.
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        timeTextField.resignFirstResponder()
        accelerationTextField.resignFirstResponder()
        initialVelocityTextField.resignFirstResponder()
    }
    
}
