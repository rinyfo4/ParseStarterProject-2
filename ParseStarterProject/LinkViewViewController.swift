//
//  LinkViewViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit

class LinkViewViewController: UIViewController {

    

    var url: NSURL?
    
       // let rightConstraint = NSLayoutConstraint(item: doneOutlet, attribute: .Right, relatedBy: .Equal, toItem: doneOutlet.superview, attribute: .Right, multiplier: 1, constant: 0.5)

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
     

        
        //print(url)
        
      //  let URLRequest = NSURLRequest(URL:(self.url)!)
       
        
       // self.webView.loadRequest(URLRequest)
    
    }
    override func didReceiveMemoryWarning() {
        
    }
    


}
