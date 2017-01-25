//
//  ViewController.swift
//  Calculator
//
//  Created by Bobby Hamrick & Alex Louzao on 1/23/17.
//  Copyright © 2017 Bobby Hamrick & Alex Louzao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //delcare the label that displays the numbers
    @IBOutlet var displayLabel: UILabel!
    
//=======================================================================================
    
    //Create stack to hold the operands (i.e. the numbers)
    struct operandStack {
        
        //Int array to hold items
        var items = [Int]()
        
        //push item onto the stack
        mutating func push(item: Int){
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
        mutating func push(item: String){
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
//provide actions for all of the operator buttons
    
    //func add(UIButton)
    //when the addition operator is pushed, add a "+" to the operators stack
    @IBAction func add(_ sender: UIButton){
        if newNum != "" {
            operands.push(item: Int(newNum)!) //push the number onto the operands stack
            operators.push(item: "+") //push the + operator onto the operator stack
            newNum = "" //reset the number to nothing in order to take new user
        }else{
            newNum = ""
        }
    }
    
    //func subtract(UIButton)
    //when the minus operator is pushed, add a "-" to the operators stack
    @IBAction func minus(_ sender: UIButton){
        if newNum != "" {
            operands.push(item: Int(newNum)!) //push the number onto the operands stack
            operators.push(item: "-") //push the - operator onto the operator stack
            newNum = "" //reset the number to nothing in order to take new user
        }else{
            newNum = ""
        }
    }
    
    //func times(UIButton)
    //when the multiplication button is pushed, add a "x" to the operators stack
    @IBAction func times(_ sender: UIButton){
        if newNum != "" {
            operands.push(item: Int(newNum)!) //push the number onto the operands stack
            operators.push(item: "x") //push the x operator onto the operator stack
            newNum = "" //reset the number to nothing in order to take new user
        }else{
            newNum = ""
        }
    }
    
    //func divide(UIButton)
    //when the division button is pushed, add a "/" to the operators stack
    @IBAction func divide(_ sender: UIButton){
        if newNum != "" {
            operands.push(item: Int(newNum)!) //push the number onto the operands stack
            operators.push(item: "/") //push the / operator onto the operator stack
            newNum = "" //reset the number to nothing in order to take new user
        }else{
            newNum = ""
        }
    }
    
    //func equal(UIButton)
    //when the equal button is pushed, call the calculate func
    //then use that return value from calculate() to set the text of displayLabel
    @IBAction func equal(_ sender: UIButton){
        if newNum != "" {
            operands.push(item: Int(newNum)!) //push the number onto the operands stack
            let ans = calculate() //call the calculate function to perform the appropriate math operations
            displayLabel.text = String(describing: ans) //take the return val from calculate and display it
            newNum = "" //reset the number to nothing in order to take new user input
        }else{
            newNum = ""
        }
    }
    
//=======================================================================================
//provide actions for all of the AC, C, +/- buttons
    
    //func allClear(UIButton)
    //when the AC button is clicked, all of the data 
    //in the stacks will be deleted
    @IBAction func allClear(_ sender: UIButton){
        operators.clearStack() //wipe out everything in the operator stack
        operands.clearStack() //wipe out everything in the operand stack
        displayLabel.text = "0" //set the text back to 0
        newNum = "" //reset the number to nothing in order to take new user input
    }
    
    @IBAction func clear(_ sender: UIButton){
        displayLabel.text = "0" //set the text back to 0
        newNum = "" //reset the number to nothing in order to take new user input
    }

//=======================================================================================
    
    //func createNum(String: num)
    //collects the number(s) that the user pressed, displays the number
    //on displayLabel and adds the number to the operand stack
    func createNum(numPressed: String){
        newNum += numPressed
        displayLabel.text = newNum
    }
    
    //func calculate() -> Int
    //this function calculate the equation that is currently being stored in the stack
    //it returns the answer to this equation in integer form
    func calculate() -> Int{
        if !operators.isEmpty() && operands.stackSize() >= 2{
            
            //collect the top two values on the stack
            let num1: Int = operands.pop()!
            let num2: Int = operands.pop()!
            
            //collect the operator sign
            let sign: String = operators.pop()!
            
            //declare a variable to hold the answer
            var ans: Int
            
            //find which operator the user clicked and 
            //perform that operation on the two operands
            switch sign{
            case "+":
                ans = num2 + num1
            case "-":
                ans = num2 - num1
            case "x":
                ans = num2 * num1
            case "/":
                ans = num2/num1
            default:
                ans = 0
            }
            
            return ans
        }else{
            return operands.top()!
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

