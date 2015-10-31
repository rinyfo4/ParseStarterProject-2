//
//  cell.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import Social

class cell: UITableViewCell {


    var counter = [Int]()

    @IBAction func tweetButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var secondLabel: UILabel!

    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productDescription: UILabel!
    
    
    @IBOutlet weak var discountPrice: UILabel!
    
    @IBOutlet weak var niceButtonOutlet: UIButton!
    @IBAction func niceButton(sender: AnyObject) {
     
        
        niceVotes.text = "\([counter])"
        
        
        
        
    }
    @IBOutlet weak var niceVotes: UILabel!
    
    
}
