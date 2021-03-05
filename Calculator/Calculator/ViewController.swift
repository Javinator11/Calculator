//
//  ViewController.swift
//  Calculator
//
//  Created by user190386 on 2/19/21.
//

import UIKit

class ViewController: UIViewController {

    private static var current_operation = [String]();
    private static var operandBuffer = [Float]();
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func processNumber(_ sender: UIButton) {
            if let numberText = sender.titleLabel?.text {
                if(displayLabel.text == "0") {
                    displayLabel.text = numberText
                } else {
                    displayLabel.text = displayLabel.text! + numberText
                }
            }
        }
    
    @IBAction func processOperation(_ sender: UIButton) {
           if let operatorText = sender.titleLabel?.text {
               ViewController.current_operation
                   .append(operatorText);
               ViewController.operandBuffer
                   .append((displayLabel.text! as NSString).floatValue);
               displayLabel.text = "0";
           }
       }
    
    @IBAction func clearBuffers(_ sender: UIButton) {
            displayLabel.text = "0";
            ViewController.current_operation.removeAll();
            ViewController.operandBuffer.removeAll();
        }
    
    @IBAction func processResult(_ sender: UIButton){
        ViewController.operandBuffer.append((displayLabel.text! as NSString).floatValue);
        var result:Float = 0.0;
        var i:Int = 0;
        
        for operand in ViewController.operandBuffer{
            if i == 0 {
                result = operand;
            }
            else{
                switch ViewController.current_operation[i - 1]{
                case "+":
                    result = result + operand;
                    break;
                case "-":
                    result = result - operand;
                    break;
                case "*":
                    result = result * operand;
                    break;
                case "/":
                    result = result / operand;
                    break;
                default:
                    break;
                }
            }
            i += 1;
        }
        displayLabel.text = String(result);
        ViewController.current_operation.removeAll();
        ViewController.operandBuffer.removeAll();
    }
    
}

