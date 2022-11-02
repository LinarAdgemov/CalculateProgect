

import UIKit

class ViewController: UIViewController {
    
    // СПИСОК ОСНОВНЫХ ПЕРЕМЕННЫХ
    
    var firstDigit : Double?
    var secondDigit : Double?
    var operationSign = ""
    var startOfNumber = true
    var firstDigitIsGiven = false
    var secondDigitIsGiven = false
    var precent = false
    var valueInt = 0
    var banOnDuplicationSign = false
//_____________________________________________

    @IBOutlet weak var result: UITextField!
    
    // ПРИ НАЖАТИИ НА ЦИФРЫ
    
    @IBAction func digitDidPressed(_ sender: UIButton) {
        if operationSign == "" {
            firstDigitIsGiven = false
        }
        if startOfNumber == true  {
            result.text = "\(sender.tag)"
            startOfNumber = false
            banOnDuplicationSign = false
        } else  {
            if result.text?.count != 15 {
                result.text! += "\(sender.tag)"
            }
        }
    }
//_____________________________________________

    
    // ПРИ НАЖАТИИ НА ОПЕРАЦИИ + - Х /

    @IBAction func actionDidPressed (_ sender: UIButton) {
        startOfNumber = true
        secondDigitIsGiven = false
        if firstDigitIsGiven == false {
            operationSign = sender.titleLabel!.text!
            firstDigit = Double (result.text!)!
            firstDigitIsGiven = true
            banOnDuplicationSign = true
            
            // checked
            print ("Первое число равно \(firstDigit!)")
        } else if banOnDuplicationSign == false {
            secondDigit = Double (result.text!)!
            
            // checked
            print ("Второе число равно \(secondDigit!)")
            
            equal(sign: operationSign)
        }
        operationSign = sender.titleLabel!.text!
    }
//_____________________________________________

    
    // ФУНКЦИЯ, ОПИСЫВАЮЩАЯ УСЛОВИЯ ВЗАИМОДЕЙСТВИЯ МЕЖДУ ДВУМЯ ОПЕРАНДАМИ
    
    func operationsWithOperands (operation: (Double?, Double?) -> Double) {
        result.text = String (operation (firstDigit,secondDigit))
        if operationSign == "/" &&  firstDigit == 0 {
            result.text = "ОШИБКА!"
            firstDigit = nil
            secondDigit = nil
            
        } else {
            
            // checked
            print ("\(firstDigit!) \(operationSign) \(secondDigit!) равно \(result.text!)")
            
            firstDigit = Double (result.text!)!
            
            // checked
            print ("Первое число равно \(firstDigit!)")
            
            if secondDigitIsGiven == false {
            secondDigit = nil
            
            // checked
            print ("Второе число равно nil")
            }
        }
        startOfNumber = true
        banOnDuplicationSign = true

    }
//_____________________________________________

    
    // РЕЗУЛЬТИРУЮЩАЯ ФУНКЦИЯ
    
    func equal (sign: String) -> () {
        
        switch operationSign {
        case "+" :
            operationsWithOperands {$0! + $1!}
           return integerChecK (firstDigit)
        case "-" :
            operationsWithOperands {$0! - $1!}
            return integerChecK (firstDigit)
            
        case "X" :
            operationsWithOperands {$0! * $1!}
            return integerChecK (firstDigit)
            
        case "/" :
            operationsWithOperands {$0! / $1!}
            return integerChecK (firstDigit)
            
        default :
            break
        }
    }
//_____________________________________________

    
    // ПРОВЕРКА ОПЕРАНДОВ НА Int (УДАЛЕНИЕ ДРОБНОЙ ЧАСТИ В СЛУЧАЕ ЕСЛИ ЗНАЧЕНИЕ - Int)

    func integerChecK (_ check: (Double?)) {
        switch check {
        case firstDigit :
            valueInt = Int (firstDigit!)
            if firstDigit! - Double (valueInt) == 0 {
                result.text = String (valueInt)
            }
        case secondDigit :
            valueInt = Int (secondDigit!)
            if secondDigit! - Double (valueInt) == 0 {
                result.text = String (valueInt)
            }
        default : break
        }
    }
//_____________________________________________

    
    // ПРИ НАЖАТИИ НА %

    @IBAction func precentDidPressed(_ sender: UIButton) {
        precent = true
        
        if operationSign == "+" || operationSign == "-"{
            secondDigit =  firstDigit!/100 * Double (result.text!)!
            result.text = String (secondDigit!)
            integerChecK(secondDigit)
            // checked
            print ("Второе число равно \(secondDigit!)")
        } else if operationSign == "X" || operationSign == "/" {
            secondDigit = Double (result.text!)! / 100
            integerChecK(secondDigit)
            result.text = String (secondDigit!)
            // checked
            print ("Второе число равно \(secondDigit!)")
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
//_____________________________________________


    // ПРИ НАЖАТИИ НА =

    @IBAction func equalDidPressed (_ sender: UIButton) {
        if firstDigitIsGiven == true && secondDigitIsGiven == false && precent == false  {
            secondDigit = Double (result.text!)!
            secondDigitIsGiven = true
            
            // checked
            print ("Второе число равно \(secondDigit!)")
        } else {
            
            // checked
            print ("Второе число равно  \(secondDigit!)")
        }
        precent = false
        equal(sign: operationSign)
    }
//_____________________________________________

    
    // ПРИ НАЖАТИИ НА .

    @IBAction func dotButtonPressed(_ sender: UIButton) {
        
        if result.text!.contains(sender.titleLabel!.text!) == false {
            result.text! += "."
            
            // checked
            print ("Добавил знак дроби")
        }
    }
//_____________________________________________

    
    // ПРИ НАЖАТИИ НА +/-

    @IBAction func plusMinusPressef(_ sender: UIButton) {
        
        firstDigit = -firstDigit!
        if result.text!.hasPrefix("-")   {
            result.text!.remove(at: result.text!.startIndex)
            
        } else {
            result.text!.insert ("-", at: result.text!.startIndex)
        }
        
        // checked
        print ("Поменялся знак")
        
    }
//_____________________________________________

    
    // ПРИ НАЖАТИИ НА C

    @IBAction func deleteDidPressed(_ sender: UIButton) {
        result.text! = "0"
        startOfNumber = true
        firstDigitIsGiven = false
        firstDigit = nil
        secondDigit = nil
        banOnDuplicationSign = false

        // checked
        print ("Удалил число Первое и Второе число равны nil")
    }
}
//_____________________________________________





