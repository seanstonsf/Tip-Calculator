//
//  ViewController.swift
//  TIp Calculator
//
//  Created by Sean Smith on 8/9/15.
//  Copyright (c) 2015 SeanSmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        println("Editing")
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = billField.text._bridgeToObjectiveC().doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = String (format: "$%.2f",tip)
        totalLabel.text = String (format: "$%.2f",total)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 0
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 0
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}


