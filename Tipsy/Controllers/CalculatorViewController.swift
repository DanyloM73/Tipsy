//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var selectedTip: Float = 0.1
    var billTotal: Float = 0.0
    var numberOfPeople = 2
    
    var totalPerPerson = "0.00"

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "0%"
        let buttonTitleWithoutPercent = String(buttonTitle.dropLast())
        if let tip = Float(buttonTitleWithoutPercent) {
            selectedTip = tip / 100
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text?.replacingOccurrences(of: ",", with: ".") ?? "0"
        
        billTotal = Float(bill) ?? 0
        
        let result = billTotal * (1 + selectedTip) / Float(numberOfPeople)
        
        totalPerPerson = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = self.totalPerPerson
            destinationVC.numberOfPeople = String(self.numberOfPeople)
            destinationVC.tip = String(self.selectedTip * 100) + "%"
        }
    }
    
}


