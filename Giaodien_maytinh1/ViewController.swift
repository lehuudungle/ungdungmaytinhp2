//
//  ViewController.swift
//  Giaodien_maytinh1
//
//  Created by Admin on 9/20/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceBeetweenInputTextFieldAndResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBeetweenResultLabelAndMidView: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    var isTappingNumber : Bool = false
    var isEndOperation : Bool = true
    var isDau : Bool = true
    var fistNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    var t1 : Bool = false
    var t2 : Bool = false
    var fistdau : Bool = false
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.userInteractionEnabled = false
        resultLabel.text = "0"
        inputTextField.text = "0"
    
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
        updateContraints()
    }

    func updateContraints() -> Void {
        
        let scale = UIScreen.mainScreen().bounds.size.height / 667
        print("chieu cao\(UIScreen.mainScreen().bounds.size.height)")
        distanceBeetweenResultLabelAndMidView.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBeetweenResultLabelAndMidView.constant * scale : distanceBeetweenResultLabelAndMidView.constant * 0.1
//        distanceBeetweenInputTextFieldAndResultLabel.constant = CGFloat(10)
        
        distanceBeetweenInputTextFieldAndResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBeetweenInputTextFieldAndResultLabel.constant * scale : distanceBeetweenInputTextFieldAndResultLabel.constant * 0.1
    
    }

    @IBAction func numberAction(sender: UIButton) {
        
        let number = sender.currentTitle
        if isTappingNumber{
            inputTextField.text = inputTextField.text! + number!
            
        }else{
            inputTextField.text = number
            isTappingNumber = true
   
        }
        t2 = true
        
        
    }
    
    @IBAction func operatorAction(sender: UIButton) {
        if(fistdau){
            if(t1 == true && t2 == true){
                equalAction(sender)
            }
            
        }else{
            fistdau = true
            
        }
        
        operation = sender.currentTitle!
        isDau = true
        t1 = true
        
        if let inputOperation = Double(inputTextField.text!) {
            
            if isEndOperation{
                fistNumber = inputOperation
                isEndOperation = false
            }else{
                fistNumber = Double(resultLabel.text!)!
                inputTextField.text = "\(fistNumber)"
            }
            
        }else{
            print("ban can nhap so vao truoc khi tinh toan")
            
        }
        isTappingNumber = false
        
        if operation == "%" {
            equalAction(sender)
            
        }else if operation == "+/-" {
            equalAction(sender)
        }
        print("t1 \(t1)")
    }

    @IBAction func equalAction(sender: UIButton) {
        isTappingNumber = false
        var result : Double = 0
        t1 = false
        t2 = false
        if let realSecondNumber = Double(inputTextField.text!){
            secondNumber = realSecondNumber
        }
        switch operation {
        case "+":
            result = fistNumber + secondNumber
        case "-":
            result = fistNumber - secondNumber
        case "*" :
            result = fistNumber * secondNumber
        case "/" :
            result = fistNumber / secondNumber
        case "%" :
            result = fistNumber / 100
        case "+/-":
            if fistNumber < 0{
                fistNumber = fabs(fistNumber)
                result = fistNumber
            }else{
                fistNumber = -1  * fistNumber
                result = fistNumber
            }
            inputTextField.text = "\(result)"
        default:
            print("code bi loi")
        }
        resultLabel.text = "\(result)"
    }
    
    @IBAction func ACAction(sender: UIButton) {
        fistNumber = 0
        secondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
        
    }
    
    @IBAction func actionMark(sender: UIButton) {
        
        if isDau {
            if inputTextField.text == "" {

                inputTextField.text = "0"
                isTappingNumber = true

            }
                
            inputTextField.text = inputTextField.text! + "."
            print(inputTextField.text)
            isDau = false
        }
        
    }
    
    
}

