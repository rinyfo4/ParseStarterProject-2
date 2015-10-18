//
//  ProductViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/17/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ProductViewController: UIViewController {

    
    let productInfo = PFObject(className:"ProductInfo")
    
    func displayAlert(title: String, message: String) {
    var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
    })))
    
    self.presentViewController(alert, animated: true, completion: nil)
    
    }


    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var ogPriceTextField: UITextField!
    @IBOutlet weak var discountPriceTextField: UITextField!
    @IBAction func nextScreenButton(sender: AnyObject) {
   
        if productNameTextField.text == "" || linkTextField.text == "" || descriptionTextField.text == "" || ogPriceTextField.text == "" || discountPriceTextField.text == "" {
            
            displayAlert(":'(", message: "You didn't fill something out!")
            
            print("Not saved")
            
        } else {
            
            
            displayAlert(":DDD", message: "Yey! Countdown to 48 hours starts now!")
            
            self.productInfo["pName"] = productNameTextField.text
            self.productInfo["pLink"] = linkTextField.text
            self.productInfo["pDescription"] = descriptionTextField.text
            self.productInfo["pOGPrice"] = ogPriceTextField.text
            self.productInfo["pDiscountPrice"] = discountPriceTextField.text
            
            self.productInfo.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    self.productInfo.saveInBackground()
                    print("Success is \(success)")
                    
                } else {
                    
                    print(error)
                    
                    // There was a problem, check error.description
                    print("success")

                }
            }
            //performSegueWithIdentifier("segueToFeed", sender: self)

            
        }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
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
