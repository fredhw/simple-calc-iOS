//
//  ViewController.swift
//  simple-calc
//
//  Created by Frederick Wijaya on 4/16/17.
//  Copyright © 2017 fredhw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // result
    @IBOutlet weak var output: UILabel!
    
    enum Operation: String {
        case Add = "+"
        case Sub = "-"
        case Mul = "*"
        case Div = "/"
        case Mod = "%"
        case Count = "Count"
        case Average = "Avg"
        case Fact = "Fact"
        case Empty = ""
        case Clear = "Clear"
    }
    
    var val1 : Double = 0.0
    var val2 : Double = 0.0
    var tempVal = ""
    var result : Double = 0.0
    var current = Operation.Empty
    var count: Int = 1
    var total: Int = 1
    var numberArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButton(_ sender: UIButton) {
        tempVal += "\(sender.tag)"
        output.text = tempVal
    }
    
    @IBAction func addButton(_ sender: Any) {
        execute(operation: Operation.Add)
    }
    
    @IBAction func subtractButton(_ sender: Any) {
        execute(operation: Operation.Sub)
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        execute(operation: Operation.Mul)
    }
    
    @IBAction func divideButton(_ sender: Any) {
        execute(operation: Operation.Div)
    }
    
    @IBAction func modButton(_ sender: Any) {
        execute(operation: Operation.Mod)
    }
    
    @IBAction func equalsButton(_ sender: Any) {
        execute(operation: current)
    }
    
    @IBAction func countButton(_ sender: Any) {
        execute(operation: Operation.Count)
    }
    
    @IBAction func averageButton(_ sender: Any) {
        numberArray.append(tempVal)
        val1 = Double(tempVal)!
        val2 = Double(tempVal)!
        tempVal = ""
        current = Operation.Average
    }
    
    @IBAction func factorialButton(_ sender: Any) {
        let factorialNumber = Int(tempVal)!
        if factorialNumber == 0 {
            result = 1.0
            
        } else {
            for index in 1...factorialNumber {
                total *= index
            }
            result = Double(total)
        }
        output.text = "\(result)"
    }
    
    @IBAction func clearButton(_ sender: Any) {
        val1 = 0.0
        val2 = 0.0
        tempVal = ""
        result = 0.0
        current = Operation.Empty
        output.text = ""
        count = 1
        total = 1
        numberArray = [String]()
    }
    
    func execute(operation: Operation) {
        if current != Operation.Empty {
            if tempVal != "" {
                val2 = Double(tempVal)!
                tempVal = ""
                
                switch current {
                case .Add :
                    result = val1 + val2
                case .Sub:
                    result = val1 - val2
                case .Mul:
                    result = val1 * val2
                case .Div:
                    result = val1 / val2
                case .Mod:
                    result = Double(Int(val1) % Int(val2))
                case .Count:
                    count += 1
                    result = Double(count)
                case .Average:
                    numberArray.append(String(val2))
                    var sum = 0.0
                    for index in numberArray {
                        sum += Double(index)!
                    }
                    result = sum / Double(numberArray.count)
                default:
                    break
                }
                
                val1 = result
                output.text = "\(result)"
                
            }
        } else {
            val1 = Double(tempVal)!
            tempVal = ""
            current = operation
        }
    }
}

