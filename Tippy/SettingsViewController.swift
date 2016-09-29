//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Mahmud, Tahmid(AWF) on 9/28/16.
//  Copyright © 2016 Mahmud, Tahmid. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lowTextField: UITextField!
    @IBOutlet weak var mediumTextField: UITextField!
    @IBOutlet weak var highTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveSettings(sender: AnyObject) {
        let low = Int(lowTextField.text!) ?? 0
        let medium = Int(mediumTextField.text!) ?? 0
        let high = Int(highTextField.text!) ?? 0
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(low, forKey: "low")
        defaults.setInteger(medium, forKey: "medium")
        defaults.setInteger(high, forKey: "high")
        defaults.synchronize()
    }

    @IBAction func restoreDefaultSettings(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(15, forKey: "low")
        defaults.setInteger(20, forKey: "medium")
        defaults.setInteger(25, forKey: "high")
        defaults.synchronize()
        
        lowTextField.text = String(15)
        mediumTextField.text = String(20)
        highTextField.text = String(25)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
     
        
        lowTextField.text = defaults.integerForKey("low") > 0 ? String(defaults.integerForKey("low")) : "15"
        mediumTextField.text = defaults.integerForKey("medium") > 0 ? String(defaults.integerForKey("medium")) : "20"
        highTextField.text = defaults.integerForKey("high") > 0 ? String(defaults.integerForKey("high")) : "25"
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
