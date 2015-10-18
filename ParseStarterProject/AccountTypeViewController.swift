//
//  AccountTypeViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/17/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class AccountTypeViewController: UIViewController {

    
    func displayAlert(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
    }
   
    
    @IBOutlet weak var entryCode: UITextField!
    
    
    @IBAction func startSellingButton(sender: AnyObject) {
       
        if entryCode.text == "" || entryCode.text != "jaysl" {
            
            displayAlert("Woooops!", message: "Enter the code!")
         
            print("failed")
            
        } else if entryCode.text == "jaysl" {
            
            print("success")
            
            performSegueWithIdentifier("productDescriptionLink", sender: self)
            
        
        }
    
    
    }
    
    
    @IBAction func showDiscountsFeed(sender: AnyObject) {
    
        //leads to the discounts feed: FeedViewController.swift
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    print("Success")

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
