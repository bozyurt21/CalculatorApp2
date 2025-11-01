//
//  Calculator.swift
//  Calculator
//
//  Created by Bensu Özyurt on 1.11.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    
    private var value : Double?
    
    private var intermediateCalculation : (num: Double, opt: String)?
    
    mutating func calculate (_ expression: String) -> Double? {
        if let value = value {
            switch expression {
                case "AC":
                    return ACMethod()
                case "+/-":
                    return minusMethod(for: value)
                case "%":
                    return percentMethod(for: value)
                case "=":
                    return performCalculation(with: value)
                default:
                    intermediateCalculation = (num: value, opt: expression)
                    return value
                }
        }
        return nil
    }
    
    private func performCalculation(with num: Double) -> Double {
        if let storedCalc = intermediateCalculation {
            switch storedCalc.opt {
                case "+":
                    return storedCalc.num + num
                case "-":
                    return storedCalc.num - num
                case "×":
                    return storedCalc.num * num
                case "/":
                    return storedCalc.num / num
                default:
                    return storedCalc.num
            }
        }
        return 0
    }
    private func ACMethod() -> Double {
        return 0
    }
    
    private func minusMethod(for value: Double) -> Double{
        return value * -1
    }
    
    private func percentMethod(for value: Double) -> Double{
        return value / 100
    }
    
    mutating func setValue(_ value: Double) {
        self.value = value
    }
}
