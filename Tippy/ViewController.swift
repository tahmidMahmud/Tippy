//
//  ViewController.swift
//  Tippy
//
//  Created by Mahmud, Tahmid(AWF) on 9/27/16.
//  Copyright © 2016 Mahmud, Tahmid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.15, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func calculateBill(sender: AnyObject) {
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let low = defaults.integerForKey("low") > 0 ? defaults.integerForKey("low") : 15
        let medium = defaults.integerForKey("medium") > 0 ? defaults.integerForKey("medium") : 20
        let high = defaults.integerForKey("high") > 0 ? defaults.integerForKey("high") : 25
        
        tipPercentages[0] = Double(low)/100.0
        tipPercentages[1] = Double(medium)/100.0
        tipPercentages[2] = Double(high)/100.0
        
        tipControl.setTitle(String(format: "%d%%", low), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format: "%d%%", medium), forSegmentAtIndex: 1)
        tipControl.setTitle(String(format: "%d%%", high), forSegmentAtIndex: 2)
    }

}

