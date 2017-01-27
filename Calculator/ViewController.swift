//
//  ViewController.swift
//  Calculator
//
//  Created by Bobby Hamrick & Alex Louzao on 1/23/17.
//  Copyright © 2017 Bobby Hamrick & Alex Louzao. All rights reserved.
//

import UIKit

//func add(a,b)
//return the sum of values a and b
func add(_ a: Int,_ b: Int) -> Int {
    return a+b
}

//func sub(a,b)
//reutrn the difference of values a and b
func sub(_ a: Int,_ b: Int) -> Int {
    return a-b
}

//func mult(a,b)
//return the multiplication of a and b
func mult(_ a: Int,_ b: Int) -> Int {
    return a*b
}

//func div(a,b)
//return the divsion of a and b
func div(_ a: Int,_ b: Int) -> Int {
    let ans: Int
    if b != 0{
        ans = a/b
    }else{
        print("Cannot divide by zero")
        ans = 0
    }
    
    return ans
}


class ViewController: UIViewController {
    
    
    //delcare the label that displays the numbers
    @IBOutlet var displayLabel: UILabel!
    
    //declare each of the operator buttons +,-,/,x
    @IBOutlet var plusOperator: UIButton!
    @IBOutlet var minusOperator: UIButton!
    @IBOutlet var divideOperator: UIButton!
    @IBOutlet var multiplyOperator: UIButton!
    
    
//=======================================================================================
    
    //Create stack to hold the operands (i.e. the numbers)
    struct operandStack {
        
        //Int array to hold items
        var items = [Int]()
        
        //push item onto the stack
        mutating func push(_ item: Int){
            items.append(item)
        }
        
        //pop item off the stack
        mutating func pop() -> Int? {
            if items.count == 0 {
                return nil
            }else{
                return items.removeLast()
            }
        }
        
        //collect the number of items in the stack
        func stackSize() -> Int{
            return items.count
        }
        
        //check to see if the stack is empty
        func isEmpty() -> Bool{
            if items.count == 0{
                return true
            }else{
                return false
            }
        }
        
        //return the item at the top of the stack
        func top() -> Int?{
            if items.count == 0{
                return nil
            }else{
                return items[items.count-1]
            }
        }
        
        //clear all items in the stack
        mutating func clearStack(){
            for _ in 0 ..< items.count {
                self.items.removeLast()
            }
        }
    }
    
//=======================================================================================

    
    //Create stack to hold the operators
    struct operatorStack {
        
        var items = [String]()
        
        //push item onto the stack
        mutating func push(_ item: String){
            items.append(item)
        }
        
        //pop item off the stack
        mutating func pop() -> String? {
            if items.count == 0 {
                return nil
            }else{
                return items.removeLast()
            }
        }
        
        //collect the number of items in the stack
        func stackSize() -> Int{
            return items.count
        }
        
        //check to see if the stack is empty
        func isEmpty() -> Bool{
            if items.count == 0{
                return true
            }else{
                return false
            }
        }
        
        //return the item at the top of the stack
        func top() -> String?{
            if items.count == 0{
                return nil
            }else{
                return items[items.count-1]
            }
        }
        
        //clear all items in the stack
        mutating func clearStack(){
            for _ in 0 ..< items.count {
                self.items.removeLast()
            }
        }
    }
    
    //declare stack of operands
    var operands = operandStack()
    
    //delcare stack of operators
    var operators = operatorStack()
    
    //declare a variable to store the numbers that are pressed
    //on the calculator. Initially store as a string to set the
    //text of displayLabel. Later will typecast to Int to perform math
    var newNum: String = ""
    
    //=======================================================================================
    //provide actions for each of the operator button
    //func displayOne(UIButton)
    //When the 0 button is pushed, display a 0 on the displayLabel
    @IBAction func displayZero(_ sender: UIButton){
        let num = "0"
        createNum(numPressed: num)
    }
    
    //func displayOne(UIButton)
    //When the 1 button is pushed, display a 1 on the displayLabel
    @IBAction func displayOne(_ sender: UIButton){
        let num = "1"
        createNum(numPressed: num)
    }
    
    //func displayTwo(UIButton)
    //When the 2 button is pushed, display a 2 on the displayLabel
    @IBAction func displayTwo(_ sender: UIButton){
        let num = "2"
        createNum(numPressed: num)
    }
    
    //func displayThree(UIButton)
    //When the 3 button is pushed, display a 3 on the displayLabel
    @IBAction func displayThree(_ sender: UIButton){
        let num = "3"
        createNum(numPressed: num)
    }
    
    //func displayFour(UIButton)
    //When the 4 button is pushed, display a 4 on the displayLabel
    @IBAction func displayFour(_ sender: UIButton){
        let num = "4"
        createNum(numPressed: num)
    }
    
    //func displayFive(UIButton)
    //When the 5 button is pushed, display a 5 on the displayLabel
    @IBAction func displayFive(_ sender: UIButton){
        let num = "5"
        createNum(numPressed: num)
    }
    
    //func displaySix(UIButton)
    //When the 6 button is pushed, display a 6 on the displayLabel
    @IBAction func displaySix(_ sender: UIButton){
        let num = "6"
        createNum(numPressed: num)
    }
    
    //func displaySeven(UIButton)
    //When the 7 button is pushed, display a 7 on the displayLabel
    @IBAction func displaySeven(_ sender: UIButton){
        let num = "7"
        createNum(numPressed: num)
    }
    
    //func displayEight(UIButton)
    //When the 8 button is pushed, display a 8 on the displayLabel
    @IBAction func displayEight(_ sender: UIButton){
        let num = "8"
        createNum(numPressed: num)
    }
    
    //func displayNine(UIButton)
    //When the 9 button is pushed, display a 9 on the displayLabel
    @IBAction func displayNine(_ sender: UIButton){
        let num = "9"
        createNum(numPressed: num)
    }
    
    //=======================================================================================
    
    //func createNum(String: num)
    //collects the number(s) that the user pressed, displays the number
    //on displayLabel and adds the number to the operand stack
    func createNum(numPressed: String){
        newNum += numPressed
        displayLabel.text = newNum
    }
    
    
    
//=========================================================================================
//take the operator and call the appropriate function
    
    
    //set a type alias to describe the function being called
    //two integer parameters and a return value of an integer
    typealias binop = (Int, Int) -> Int
    
    //Declare and initialze ops to discern between what function to use.
    let ops: [String: binop] = ["+":add,"X":mult,"-":sub,"/":div]
    
    //func getOperator(UIButton)
    //when an operator is clicked, it will be added to the stack. 
    //If the = button is clicked then it will call the calculate func
    @IBAction func getOperator(_ sender: UIButton)
    {
        let sign = sender.titleLabel!.text! //get the label of the button pushed
        
        //check to see if the button pushed was ==
        if sign == "="{
            operands.push(Int(newNum)!) //push the number onto the operand stack
            let num1 = operands.pop()! //pop the number from operand stack
            let num2 = operands.pop()! //pop the 2nd number from the operand stack
            let oper = operators.pop()! //pop the operator on the operator stack
            
            calculate(num1, num2, oper) //calculate the solution
            newNum = "" //reset the number so user can perform new problem
        }else{
            operands.push(Int(newNum)!) //push the number onto the operand stack
            operators.push(sign) //if a sign was pushed then push it onto the operator stack
            newNum = "" //reset newNum so user can input new number
        }
        
    }
    
    //func calculate(a,b,op)
    //when a user clicks the = button the two numbers on the stack and the
    //operate will be used to output the correct solution. The operator tell which
    //function should be called and that function is performed using the two numbers
    //from the operand stack. The anser is displayed on the label.
    func calculate(_ a: Int,_ b: Int,_ op: String){
        let opFunc = ops["\(op)"]
        
        let result: Int = opFunc!(a,b)
        
        displayLabel.text = String(result)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

