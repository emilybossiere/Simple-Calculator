//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Emily Bossiere on 2/28/18.
//  Copyright © 2018 Emily Bossiere. All rights reserved.
//

import UIKit

enum functions {
    case notSet;
    case addition;
    case subtraction;
    case multiplication;
    case division;
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    
    
    var labelString:String = "0"
    var currentFunction:functions = .notSet
    var savedNum:Float = 0
    var lastButtonWasFunction:Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressPlus(_ sender: Any) {
        changeFunction(newFunction: .addition)
        
    }
    
    @IBAction func pressMinus(_ sender: Any) {
        changeFunction(newFunction: .subtraction)
        
    }
    
    @IBAction func pressMultiply(_ sender: Any) {
        changeFunction(newFunction: .multiplication)
        
    }
    
    @IBAction func pressDivide(_ sender: Any) {
        changeFunction(newFunction: .division)
        
    }
    
    @IBAction func pressEquals(_ sender: Any) {
        guard let labelInt:Float = Float(labelString) else {
            return
        }
        
        if (currentFunction == .notSet || lastButtonWasFunction) {
            return
        }
        
        if (currentFunction == .addition){
            savedNum += labelInt
        }
        else if (currentFunction == .subtraction){
            savedNum -= labelInt
        }
        
        else if (currentFunction == .multiplication){
            savedNum *= labelInt
        }
        else if (currentFunction == .division){
            savedNum /= labelInt
        }
        
        currentFunction = .notSet
        labelString = "\(savedNum)"
        
        updateText()
        lastButtonWasFunction = true
    }
    
    @IBAction func pressClear(_ sender: Any) {
        labelString = "0"
        currentFunction = .notSet
        savedNum = 0
        lastButtonWasFunction = false
        label.text = "0"
        
    }
    
    @IBAction func pressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        if(lastButtonWasFunction){
            lastButtonWasFunction = false
            labelString = "0"
        }
        
        
        labelString = labelString.appending(stringValue!)
        updateText()
        
    }
    
    
    
    func updateText() {
        guard let labelInt:Float = Float(labelString) else {
            return
        }
        
        if (currentFunction == .notSet) {
            savedNum = Float(labelInt)
        }
        
        label.text = "\(labelInt)"
        
    }
    
    func changeFunction(newFunction:functions) {
        if (savedNum == 0) {
            return
        }
        
        currentFunction = newFunction
        lastButtonWasFunction = true
    }

}

