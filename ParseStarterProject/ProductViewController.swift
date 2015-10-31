//
//  ProductViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/17/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ProductViewController: UIViewController, UITextFieldDelegate {

    let limitLength = 40
    let productInfo = PFObject(className:"ProductInfo")
    
    let saveProducts = PFObject(className: "SaveProducts")
    
    func displayAlert(title: String, message: String) {
    var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
    
    self.dismissViewControllerAnimated(true, completion: nil)
    
    })))
    
    self.presentViewController(alert, animated: true, completion: nil)
    
    }
//

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
           
            var httpAddition = "http://"
            var dollarSign = "$"

            self.saveProducts["pName"] = productNameTextField.text
            self.saveProducts["pLink"] = "\(httpAddition + linkTextField.text!)"
            self.saveProducts["pDescription"] = descriptionTextField.text
            self.saveProducts["pOGPrice"] = "\(dollarSign + ogPriceTextField.text!)"
            self.saveProducts["pDiscountPrice"] = "\(dollarSign + discountPriceTextField.text!)"
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

      //      var httpAddition = "http://"
        //    var dollarSign = "$"
            
            self.saveProducts["pName"] = productNameTextField.text
            self.saveProducts["pLink"] = "\(httpAddition + linkTextField.text!)"
            self.saveProducts["pDescription"] = descriptionTextField.text 
            self.saveProducts["pOGPrice"] = "\(dollarSign + ogPriceTextField.text!)"
            self.saveProducts["pDiscountPrice"] = "\(dollarSign + discountPriceTextField.text!)"
        
            self.saveProducts.saveInBackgroundWithBlock {
                
                (success: Bool, error: NSError?) -> Void in
                
                if (success) {
                 
                    self.saveProducts.saveInBackground()
                    print("Success is \(success)")
                    
                    self.performSegueWithIdentifier("productRegistered", sender: self)

                } else {
                 
                    print(error)
                    print("error")
                }
            
            
            }
        
        
        }

        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        self.productNameTextField.delegate = self
        self.linkTextField.delegate = self
        self.descriptionTextField.delegate = self
        self.ogPriceTextField.delegate = self
        self.discountPriceTextField.delegate = self

        //Search up how to return keybaord without delegate function 
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
   
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.productNameTextField.resignFirstResponder()
        self.linkTextField.resignFirstResponder()
        self.descriptionTextField.resignFirstResponder()
        self.ogPriceTextField.resignFirstResponder()
        self.discountPriceTextField.resignFirstResponder()
        
        return true
        
      }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            
            return true
        
        }
        
        if !(textField == productNameTextField || textField == descriptionTextField) {
            return true
        
        }
        
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
