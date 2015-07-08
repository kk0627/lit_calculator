//
//  ViewController.swift
//  lit_calculator
//
//  Created by keita kutsuno on 2015/07/08.
//  Copyright (c) 2015年 keita kutsuno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel: UILabel!
    var number : Double = 0
    var number2 : Double!
    var operation : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickNumberButton(sender:UIButton) {
        number = number*10 + Double(sender.tag)
        doubleToInt()
    }
    
    @IBAction func allClear(){
        number = 0
        doubleToInt()
    }
    
    @IBAction func plus() {
        doubleToInt()
        number2 = number
        operation = 1
        number = 0
    }
    
    @IBAction func minus() {
        doubleToInt()
        number2 = number
        operation = 2
        number = 0
    }
    
    @IBAction func times() {
        doubleToInt()
        number2 = number
        operation = 3
        number = 0
    }
    
    @IBAction func devided() {
        doubleToInt()
        number2 = number
        operation = 4
        number = 0
    }
    
    @IBAction func equal(){
        if operation == 1{
            number = number + number2
            doubleToInt()
            operation = 0
        }
        
        if operation == 2{
            number = number2 - number
            doubleToInt()
            operation = 0
        }
        
        if operation == 3{
            number = number * number2
            doubleToInt()
            operation = 0
        }
        
        if operation == 4{
            number = number2 / number
            doubleToInt()
            operation = 0
        }
        
    }
    
    func doubleToInt(){
        
        var numberString : String = String(stringInterpolationSegment: number)
        if numberString.hasSuffix("0"){
            
            var startIndex:String.Index
            var endIndex:String.Index
            
            //0文字目から
            startIndex = advance(numberString.startIndex,0)
            //末尾から2文字目(.0)まで
            endIndex = advance(numberString.startIndex, count(numberString) - 2)
            var newString = numberString.substringWithRange(Range(start:startIndex ,end:endIndex))
            
            myLabel.text = newString
            
        }else{
            myLabel.text = String(stringInterpolationSegment: number)
        }
        
        
    }

}