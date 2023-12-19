//
//  CalculatorEngine.swift
//  UIKitLearn
//
//  Created by 江佳谊 on 2023/12/19.
//

import Foundation

class CalculateEngine: NSObject {
    let funcArrays: CharacterSet = [
        "+",
        "-",
        "x",
        "%",
        "/",
        "^"
    ]
    
    func calculatEquation(equation: String) -> Double {
        //以运算符分割,获取到所有数字
        //例："12 + 23 - 1" -> ["12", "23", "1"]
        let elementArray = equation.components(separatedBy: funcArrays)
        print(elementArray)
        var point = 0
        //"12"
        var result: Double = Double(elementArray[point])!
        
        for char in equation {
            switch char {
            case "+":
                //指向下一个数
                point += 1
                if elementArray.count>point {
                    //result = 12 + 23
                    result += Double(elementArray[point])!
                }
                break
            case "-":
                point += 1
                if elementArray.count>point {
                    result -= Double(elementArray[point])!
                }
                break
            case "x":
                point += 1
                if elementArray.count>point {
                
                    result *= Double(elementArray[point])!
                }
                break
            case "/":
                point += 1
                if elementArray.count>point {
   
                    result /= Double(elementArray[point])!
                }
                break
            case "%":
                point += 1
                if elementArray.count>point {
                
                    result = Double( Int(result) % Int(elementArray[point])!)
                }
                break
            case "^":
                point += 1
                if elementArray.count>point {
                    let base = result
                    let power = Int(elementArray[point])!
                    for _ in 1..<power {
                        result *= base
                    }
                }
                break
            default:
                break
            }
        }
        return result
    }
}
