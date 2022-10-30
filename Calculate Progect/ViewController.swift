//
//  ViewController.swift
//  CalCul
//
//  Created by Linar Adgemov on 30.06.2022.
//

import UIKit

//КОМИТ
//КОМИТ

class ViewController: UIViewController {
    var firstDigit : Double = 0
    var secondDigit : Double = 0
    //todo переделать на enum
    var operationSign = ""
    var startOfNumber = true
    var firstDigitIsGiven = false
    //    var secondDigitIsGiven = false
    var precent = false
    var valueInt = 0
    
    
    @IBOutlet weak var result: UITextField!
    
    
    @IBAction func digitDidPressed(_ sender: UIButton) {
        if operationSign == "" {
            firstDigitIsGiven = false
        }
        if startOfNumber == true  {
            result.text = "\(sender.tag)"
            startOfNumber = false
        } else  {
            if result.text?.count != 15 {
                result.text! += "\(sender.tag)"
            }
        }
    }
    
    
    @IBAction func actionDidPressed (_ sender: UIButton) {
        startOfNumber = true
        operationSign = sender.titleLabel!.text!
        if firstDigitIsGiven == false {
            firstDigit = Double (result.text!)!
            firstDigitIsGiven = true
        }
        //        } else {
        //            secondDigit = Double (result.text!)!
        //
        //            // checked
        //            print ("Второе число равно \(secondDigit)")
        //
        //        }
        
        // checked
        print ("Первое число равно \(firstDigit)")
    }
    
    
    func operationsWithOperands (operation: (Double, Double) -> Double) {
        result.text = String (operation (firstDigit,secondDigit))
        if operationSign == "/" &&  firstDigit == 0 {
            result.text = "ОШИБКА!"
            firstDigit = 0
            secondDigit = 0
            
        } else {
            firstDigit = Double (result.text!)!
            
            // checked
            print ("Первое число равно \(firstDigit)")
        }
        startOfNumber = true
        operationSign = ""
    }
    
    func integerChecK (_ check: (Double)) {
        switch check {
        case firstDigit :
            valueInt = Int (firstDigit)
            if firstDigit - Double (valueInt) == 0 {
                result.text = String (valueInt)
            }
        case secondDigit :
            valueInt = Int (secondDigit)
            if secondDigit - Double (valueInt) == 0 {
                result.text = String (valueInt)
            }
        default : break
        }
        
    }
    
    @IBAction func precentDidPressed(_ sender: UIButton) {
        precent = true
        
        if operationSign == "+" || operationSign == "-"{
            secondDigit =  firstDigit/100 * Double (result.text!)!
            result.text = String (secondDigit)
            integerChecK(secondDigit)
            // checked
            print ("Второе число равно \(secondDigit)")
        } else if operationSign == "X" || operationSign == "/" {
            secondDigit = Double (result.text!)! / 100
            integerChecK(secondDigit)
            result.text = String (secondDigit)
            // checked
            print ("Второе число равно \(secondDigit)")
        } else {
            result.text! = String (Double (result.text!)! / 100)
            precent = false
            firstDigit = Double (result.text!)!
            integerChecK(firstDigit)
        }
        if result.text == "0" {
            result.text = "0"
        }
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        if firstDigitIsGiven == true && precent == false {
            
            secondDigit = Double (result.text!)!
            //            secondDigitIsGiven = true
            
            
            // checked
            print ("Второе число равно \(secondDigit)")
        }
        precent = false
        
        switch operationSign {
        case "+" :
            operationsWithOperands {$0 + $1}
            integerChecK (firstDigit)
        case "-" :
            operationsWithOperands {$0 - $1}
            integerChecK (firstDigit)
            
        case "X" :
            operationsWithOperands {$0 * $1}
            integerChecK (firstDigit)
            
        case "/" :
            operationsWithOperands {$0 / $1}
            integerChecK (firstDigit)
            
        default :
            break
        }
    }
    
    
    
    
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        if result.text!.contains(sender.titleLabel!.text!) == false {
            result.text! += "."
            
            // checked
            print ("Добавил знак дроби")
            
        }
    }
    
    
    @IBAction func plusMinusPressef(_ sender: UIButton) {
        
        firstDigit = -firstDigit
        if result.text!.hasPrefix("-")   {
            result.text!.remove(at: result.text!.startIndex)
            
        } else {
            result.text!.insert ("-", at: result.text!.startIndex)
        }
        // checked
        
        print ("Поменялся знак")
        
    }
    
    
    @IBAction func deleteDidPressed(_ sender: UIButton) {
        result.text! = "0"
        startOfNumber = true
        firstDigitIsGiven = false
        
        // checked
        print ("Удалил число")
    }
}








//startOfNumber = true
//        if firstOperandGiven == false {
//            firstDigit = Double (result.text!)!
//            firstOperandGiven = true
//            print ("Первый операнд задан и равен \(firstDigit)")
//        } else {
//            secondDigit = Double (result.text!)!
//            print ("Второй операнд равен \(secondDigit)")
//        }
//    }
//    @IBAction func equals(_ sender: UIButton) {
//        secondDigit = Double (result.text!)!
//
//        switch curentOperation {
//        case .plus :
//            result.text = "\(firstDigit + secondDigit) "
//            firstDigit = Double (result.text!)!
//        case .minus :
//            result.text = "\(firstDigit - secondDigit)"
//            firstDigit = Double (result.text!)!
//        case .multiply :
//            result.text = "\(firstDigit * secondDigit)"
//            firstDigit = Double (result.text!)!
//        case .divide :
//            result.text = "\(firstDigit / secondDigit)"
//            firstDigit = Double (result.text!)!
//        case .none:
//            result.text = nil
//        }
//    }
//    enum Operation {
//        case plus
//        case minus
//        case multiply
//        case divide
//    }
//    }

























// multiplyDidPressed
//    @IBAction func action (_ sender: UIButton) {
//        startOfNumber = true
//        checkOperands += 1
//        if   checkOperands == 1 {
//            firstDigit = Int (result.text!)!
//        } else {
//            secondDigit = Int (result.text!)!
//            result.text = "\(firstDigit  secondDigit)"
//            firstDigit = Int (result.text!)!
//        }


//        if firstDigit == 0 {
//        firstDigit = Int (result.text!)!
//        } else {
//
//     firstDigit
//    }
//}
//    @IBAction func divideDidPressed(_ sender: UIButton) {
//    }
//
//    @IBAction func minusDidPressed(_ sender: UIButton) {
//    }
//
//    @IBAction func plusDidPressed(_ sender: UIButton) {
//    }
//
//    @IBAction func resultDidPressed(_ sender: UIButton) {
//        if let first = firstDigit, let second = secondDigit {
//           switch operation {
//           case .multiply:
//                result.text = "\(first * second) "
//            case .minus:
//                result.text = "\(first - second) "
//            case .plus:
//                result.text = "\(first + second) "
//            case .none:
//                result = nil
//
//            default : break
//            }
//        }
//    }
//    @IBAction func textDeleteDidPressed(_ sender: UIButton) {
//        result.text = ""
//    }
//}
//
//
//    switch operation {
//
//    }
//    class operationLogic {
//
//    }
//
//    enum Operation {
//        case multiply
//        case divide
//        case minus
//        case plus
//
//    }
//}



