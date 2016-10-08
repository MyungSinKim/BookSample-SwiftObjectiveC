//
//  Copyright (c) 2016 Keun young Kim <book@meetkei.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

let firstOperand = 2
let secondOperand = 3
let op = "*"

func selectOperator(operator op: String) -> ((Int, Int) -> Int)? {
    let str = "CALL Nested Function"
    
    func add(_ a: Int, _ b: Int) -> Int {
        print("\(str) [\(#function)] matching operator \(op)")
        return a + b
    }
    
    func subtract(_ a: Int, _ b: Int) -> Int {
        print("\(str) [\(#function)] matching operator \(op)")
        return a - b
    }
    
    func multiply(_ a: Int, _ b: Int) -> Int {
        print("\(str) [\(#function)] matching operator \(op)")
        return a * b
    }
    
    func divide(_ a: Int, _ b: Int) -> Int {
        print("\(str) [\(#function)] matching operator \(op)")
        return a / b
    }
    
    switch op {
    case "+":
        return add
    case "-":
        return subtract
    case "*":
        return multiply
    case "/":
        return divide
    default:
        return nil
    }
}

func processResult(function f: (Int, Int) -> Int, lhs: Int, rhs: Int) -> Int {
    return f(lhs, rhs)
}

if let calc = selectOperator(operator: op) {
    let result = processResult(function: calc, lhs: firstOperand, rhs: secondOperand)
    print("\(firstOperand) \(op) \(secondOperand) = \(result)")
} else {
    print("not supported")
}
// CALL Nested Function [multiply] matching operator *
// 2 * 3 = 6
