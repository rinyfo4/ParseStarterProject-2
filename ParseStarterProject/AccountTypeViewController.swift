//
//  AccountTypeViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/17/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class AccountTypeViewController: UIViewController, UITextFieldDelegate {

    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
   
    
    
    
    @IBAction func startSellingButton(sender: AnyObject) {
        
    
    }
    
    
    @IBAction func showDiscountsFeed(sender: AnyObject) {
    

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    

    }
    

    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
