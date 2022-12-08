//
//  ViewController.swift
//  bodyMass
//
//  Created by Ekrem on 7.12.2022.

import UIKit

class calculatorVC: UIViewController {

    var calculatorEngine = CalculatorEngine()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format:"%.2f", sender.value)
        heightLabel.text = "\(height)M"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format:"%.0f", sender.value)
        weightLabel.text = "\(weight)KG"
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) {
        let heigt = heightSlider.value
        let weight = weightSlider.value
        
        calculatorEngine.calculatBMI(height: heigt, weight: weight)
        self.performSegue(withIdentifier: "toResultVC", sender: self)
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorEngine.getBMIValue()
            destinationVC.advice = calculatorEngine.GetAdvice()
            destinationVC.color = calculatorEngine.GetColor()
        }
    }
    
}

