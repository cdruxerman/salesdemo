//
//  MenuViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 28/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet var txtSearch: UITextField!
    @IBOutlet var tblItems : UITableView!
    var selectedColor :UIColor!
    var items : NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtSearch.setValue(UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1), forKeyPath: "_placeholderLabel.textColor")
        selectedColor = UIColor(red: 0.0/255.0, green: 181.0/255.0, blue: 229.0/255.0, alpha: 1)
        self.populateArray()
        var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.menuViewContorller = self;
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateArray() {
        self.addItem("icon-menu-explore-normal", withTitle:"Explore", andSegue:"Explore", selectedIcon:"icon-menu-explore-selected")
        self.addItem("icon-menu-activity-normal", withTitle:"Activity", andSegue:"Activity", selectedIcon:"icon-menu-activity-selected")
        self.addItem("icon-menu-cart-normal", withTitle:"Cart", andSegue:"Cart", selectedIcon:"icon-menu-cart-selected")
        self.addItem("icon-menu-setting-normal", withTitle:"Settings", andSegue:"Settings", selectedIcon:"icon-menu-setting-selectedl")
        self.addItem("icon-menu-logout-normal", withTitle:"Logout", andSegue:"Logout", selectedIcon:"icon-menu-logout-logout")
    }
    
    func addItem(icon:String, withTitle title:String, andSegue segue:String, selectedIcon selIcon:String) {
        items.addObject(["icon":icon, "title":title, "segue":segue, "selectedIcon":selIcon])
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell : LoginTableViewCell!
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["icon"] as NSString!
        var title = itemDic["title"] as NSString!
        
        cell = tblItems.dequeueReusableCellWithIdentifier("MenuItemCell") as LoginTableViewCell
        cell.itemImg.image = UIImage(named: icon)
        cell.itemTitle.text = title
        
        if (indexPath.row == 0) {
            var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
            var icon = itemDic["selectedIcon"] as NSString!
            var segue = itemDic["segue"] as NSString!
            cell.itemTitle.textColor = selectedColor
            cell.itemImg.image = UIImage(named: icon)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        
        var indexP :NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        var cell1 : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexP) as LoginTableViewCell
        self.deselectCell(cell1, indexP: indexP)
        
        var cell : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexPath) as LoginTableViewCell
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["selectedIcon"] as NSString!
        var segue = itemDic["segue"] as NSString!
        cell.itemTitle.textColor = selectedColor
        cell.itemImg.image = UIImage(named: icon)
        if (!segue.isEqualToString("Logout")) {
            self.performSegueWithIdentifier(segue, sender: nil)
        } else {
            var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
            appDelegate.logoutSuccessful()
        }
    }

    func showCart() {

        self.performSegueWithIdentifier("Cart", sender: nil)

    }
    
    func deselectCell(cell:LoginTableViewCell, indexP indexPath:NSIndexPath) {
        var itemDic = items.objectAtIndex(indexPath.row) as [String : String];
        var icon = itemDic["icon"] as NSString!
        cell.itemTitle.textColor = UIColor.whiteColor()
        cell.itemImg.image = UIImage(named: icon)
        
    }
    
    func tableView(tableView: UITableView!, didDeselectRowAtIndexPath indexPath: NSIndexPath!){
        var cell : LoginTableViewCell! = tblItems.cellForRowAtIndexPath(indexPath) as LoginTableViewCell
        self.deselectCell(cell, indexP: indexPath)
    }
    
    func textFieldShouldReturn (textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func unwindToMenuViewController(segue: UIStoryboardSegue) {
        
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
