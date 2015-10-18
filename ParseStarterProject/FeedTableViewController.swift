//
//  FeedTableViewController.swift
//  ParseStarterProject
//
//  Created by Luka Ivicevic on 10/18/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse


class FeedTableViewController: UITableViewController {

    var productName = [String]()
    var productDescription = [String]()
    var discountPrice = [String]()
    var linksArray = [String]()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        var query = PFQuery(className: "ProductInfo")
        
        query.findObjectsInBackgroundWithBlock ({ (objects, error) -> Void in
            
        if let objects = objects {
         
            self.productName.removeAll(keepCapacity: true)
            self.productDescription.removeAll(keepCapacity: true)
            self.discountPrice.removeAll(keepCapacity: true)
          //  self.linkArray.removeAll(keepCapacity: true)
            
            
            for object in objects {
             
                self.productName.append(object["pName"] as! String)
            
                self.discountPrice.append(object["pDiscountPrice"] as! String)
                
                self.productDescription.append(object["pDescription"] as! String)
                
                self.linksArray.append((object["pLink"] as? String)!)
                
                
                print(self.productName)
                print(self.productDescription)
                print(self.discountPrice)
                print(self.linksArray)
                
                self.tableView.reloadData()
            
                
                }
            
            
        
            
            }
        
        
        
        })
        
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

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

        myCell.productName.text = productName[indexPath.row]
        myCell.productDescription.text =  productDescription[indexPath.row]
        myCell.discountPrice.text = discountPrice[indexPath.row]
        
        
        
        return myCell
    }
    
   
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                
        let myWebView = self.storyboard!.instantiateViewControllerWithIdentifier("webViewController") as! LinkViewViewController

        myWebView.url = NSURL(string:"https:www.apple.com")
     
        
        //myWebView.url = NSURL(string: "\(linksArray[indexPath.row])")
        
        self.presentViewController(myWebView, animated: true, completion: nil)
   
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
