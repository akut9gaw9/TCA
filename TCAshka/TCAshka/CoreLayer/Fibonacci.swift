//
//  Fibonacci.swift
//  TCAshka
//
//  Created by Stanislav on 26.10.2023.
//

import Foundation

// MARK: - Int

extension Int {
    
    // MARK: - Fibonacci Number Calculation
    
    public func fibonacciNumCalculation(num: Int) -> Int {
        if num == 0 { return 0 }
        if num == 1 { return 1 }
        return fibonacciNumCalculation(num: num - 1) + fibonacciNumCalculation(num: num - 2)
    }
}
