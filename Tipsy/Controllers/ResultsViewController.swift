//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by danylo on 16.01.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson: String?
    var numberOfPeople: String?
    var tip: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalPerPerson
        settingsLabel.text = "Split between \(numberOfPeople ?? "0") people, with \(tip ?? "0%") tip."
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true , completion: nil)
    }
    
}
