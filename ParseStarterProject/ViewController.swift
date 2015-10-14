//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

//TEST 2

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in with Twitter!")
                } else {
                    print("User logged in with Twitter!")
                }
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

