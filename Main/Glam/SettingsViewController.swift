//
//  SettingsViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 28/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet var tblItems : UITableView!
    var items : NSArray! = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Cell1","Cell2","Cell3","Cell4","Cell5","Cell6"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
   
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell : UITableViewCell!
        cell = tblItems.dequeueReusableCellWithIdentifier(items.objectAtIndex(indexPath.row) as String) as UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view :UIView! = UIView(frame: CGRectMake(0, 0, 320, 1))
        return view
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
