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

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
     
        print(url)
        
        let URLRequest = NSURLRequest(URL:(self.url)!)
       
        
        self.webView.loadRequest(URLRequest)
    
    }
    override func didReceiveMemoryWarning() {
        
    }

}
