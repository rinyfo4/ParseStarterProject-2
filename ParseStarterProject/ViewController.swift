//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

//TEST 2

import UIKit
import Parse

class ViewController: UIViewController {

    @IBAction func logInTwtr(sender: AnyObject) {
    ///
        ///
        
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in with Twitter!")
                    
                    self.performSegueWithIdentifier("showSignInScreen", sender: self)

                } else {
                    print("User logged in with Twitter!")
                    self.performSegueWithIdentifier("showSignInScreen", sender: self)

                }
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }

    
    }
   
    override func viewDidAppear(animated: Bool) {
                
   //
        PFUser.logOut()
       //sdfsdf
        if PFUser.currentUser()?.username != nil {
            
            
            self.performSegueWithIdentifier("loggedIn", sender: self)
        
        }
        
    if let username = PFUser.currentUser()?.username  {
         
            self.performSegueWithIdentifier("showSignInScreen", sender: self)
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

