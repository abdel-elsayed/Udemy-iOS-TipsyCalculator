//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Abdelrahman Elsayed on 9/19/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultText: String = "0.0"
    var billTotal: Double = 0.0
    var tipSelected: Double = 0
    var split: Int = 0
    
    @IBOutlet weak var totalLabelText: UILabel!
    @IBOutlet weak var descriptionLabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabelText.text = resultText
        descriptionLabelText.text = "Split between \(split) people, with \(tipSelected  * 100)% tip."
    }
    
    @IBAction func recalculateButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
