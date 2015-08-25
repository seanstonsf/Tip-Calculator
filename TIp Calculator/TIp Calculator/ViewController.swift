//
//  ViewController.swift
//  TIp Calculator
//
//  Created by Sean Smith on 8/9/15.
//  Copyright (c) 2015 SeanSmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var entireContainerView: DesignableView!
    @IBOutlet weak var billFieldContainerView: DesignableView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipCalcContainerView: UIView!
    @IBOutlet weak var prefilledContainerView: UIView!
    @IBOutlet weak var title22Label: UILabel!
    @IBOutlet weak var title20Label: UILabel!
    @IBOutlet weak var title18Label: UILabel!
    @IBOutlet weak var per22Label: UILabel!
    @IBOutlet weak var tot22Label: UILabel!
    @IBOutlet weak var per20Label: UILabel!
    @IBOutlet weak var tot20Label: UILabel!
    @IBOutlet weak var per18Label: UILabel!
    @IBOutlet weak var tot18Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        per22Label.text = "$0.00"
        per20Label.text = "$0.00"
        per18Label.text = "$0.00"
        tot22Label.text = "$0.00"
        tot20Label.text = "$0.00"
        tot18Label.text = "$0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("Editing")
        prefilledContainerView.alpha = 0
        tipCalcContainerView.alpha = 1
        

        let billAmount = billField.text._bridgeToObjectiveC().doubleValue
        let tip22 = billAmount * 0.22
        let tip20 = billAmount * 0.20
        let tip18 = billAmount * 0.18
       
        let tot22 = billAmount + tip22
        let tot20 = billAmount + tip20
        let tot18 = billAmount + tip18
        
        per18Label.text = String (format: "$%.2f",tip18)
        per20Label.text = String (format: "$%.2f",tip20)
        per22Label.text = String (format: "$%.2f",tip22)
        tot18Label.text = String (format: "$%.2f",tot18)
        tot20Label.text = String (format: "$%.2f",tot20)
        tot22Label.text = String (format: "$%.2f",tot22)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


