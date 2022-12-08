//
//  CalculatorEngine.swift
//  bodyMass
//
//  Created by Ekrem on 7.12.2022.

import UIKit

struct CalculatorEngine {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
      
        let bmiTo1Decimal = String(format: "%.1f", bmi?.value ?? 0.0 )
        
            return bmiTo1Decimal
     
    }
    
    func GetAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func GetColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    
    
    mutating func calculatBMI(height: Float, weight: Float) {
       let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
           bmi = BMI(value: bmiValue, advice: "Eat more pizza!!!", color: .blue)
            
        } else if bmiValue < 24.9 {
           bmi = BMI(value: bmiValue, advice: "Stay fit!", color: .green)
            
        } else {
           bmi = BMI(value: bmiValue, advice: "Eat less pizza!!!", color: .red)
            
        }
        
       
    }
}
