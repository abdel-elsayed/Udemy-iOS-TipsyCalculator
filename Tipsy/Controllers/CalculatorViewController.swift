//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var billTotal: Double = 0.0
    var tipSelected: Double = 0
    var split: Int = 0
    var resultTo2DecimalPlaces: String = "0.0"
    
    
    @IBOutlet weak var billTotalTextOutlet: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitBillLabel: UILabel!
    
    @IBAction func tipSelected(_ sender: UIButton) {
        //deselcting all the buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //selecting the chosen button
        sender.isSelected = true
        
//        let buttonTitle = sender.currentTitle?.dropLast()
//        tipSelected = Double(buttonTitle!) ?? 0
//        tipSelected /= tipSelected
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipSelected = buttonTitleAsANumber / 100
    }
    
    @IBAction func splitSelected(_ sender: UIStepper) {
        
        
        
        splitBillLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)
    }
    
    @IBAction func calculateButtonSelected(_ sender: UIButton) {
        
        
        let bill = billTotalTextOutlet.text!
                
                //If the text is not an empty String ""
                if bill != "" {
                    
                    //Turn the bill from a String e.g. "123.50" to an actual String with decimal places.
                    //e.g. 125.50
                    billTotal = Double(bill)!
                    
                    //Multiply the bill by the tip percentage and divide by the number of people to split the bill.
                    let result = billTotal * (1 + tipSelected) / Double(split)

                    //Round the result to 2 decimal places and turn it into a String.
                    resultTo2DecimalPlaces = String(format: "%.2f", result)
                }
            
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.resultText = resultTo2DecimalPlaces
            resultVC.split = split
            resultVC.tipSelected = tipSelected
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

