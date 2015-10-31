//
//  FeedTableViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse
import Social

//Test Version 

class FeedTableViewController: UITableViewController {
  
    var expiresAt: NSDate?

    
    var refresher: UIRefreshControl!
    var dateAppend = [NSDate?]()
    
    
    var productName = [String]()
    var timerInt = [Int]()
   
   
 


    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var query = PFQuery(className: "ProductInfo")
        
        query.findObjectsInBackgroundWithBlock ({ (objects, error) -> Void in
            
            if let objects = objects {
                
                self.productName.removeAll(keepCapacity: true)
                self.timerInt.removeAll(keepCapacity: true)
                
                for object in objects {
                    
                    
                    self.productName.append(object["pName"] as! String)
                    self.dateAppend.append(object.createdAt as NSDate!!)
                    
                    var createdAt = object.createdAt
                    
                    if createdAt != nil {
                    
                        
                        
                        let twentyFourHours = NSTimeInterval(60 * 60 * 24)
                  //      self.expiresAt = NSDate(timeInterval: twentyFourHours, sinceDate: createdAt)
                        
                       
                        self.scheduleTimer()

                        
                    }
                    
                }
                
                self.tableView.reloadData()
            }

        })

    }
    
    func scheduleTimer() {
        NSTimer.scheduledTimerWithTimeInterval(1.0 / 30.0, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }
    
    @objc
    func tick(timer: NSTimer) {
        guard let expiresAt = expiresAt else {
            return
        }
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        if let components = calendar?.components([.Hour, .Minute, .Second], fromDate: NSDate(), toDate: expiresAt, options: []) {
            
            
            print(formatDateComponents(components))
        }
        
        self.tableView.reloadData()
    }

    func formatDateComponents(components: NSDateComponents) -> String {
        let hours = components.hour
        let minutes = components.minute
        let seconds = components.second
        return "\(hours):\(minutes):\(seconds)"
    }

  

    
    
    
    
    
    
    
    
    
    


    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! cell
        
      
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let components = calendar?.components([.Hour, .Minute, .Second], fromDate: NSDate(), toDate: expiresAt!, options: [])
    
        
        myCell.secondLabel.text = String(formatDateComponents(components!))

//        myCell.secondLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        myCell.productName.text = productName[indexPath.row]

        
        
        return myCell
   
    }
    
   

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                
        let myWebView = self.storyboard!.instantiateViewControllerWithIdentifier("webViewController") as! LinkViewViewController

        
            self.presentViewController(myWebView, animated: true, completion: nil)
        
        
    }

   
}
