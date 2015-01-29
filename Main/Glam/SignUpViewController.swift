//
//  SignUpViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 28/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var contentScroll : UIScrollView!
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentScroll.contentSize = CGSizeMake(320, 568);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("willShowKeyBoard:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("willHideKeyBoard:"), name:UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func willShowKeyBoard(notification : NSNotification){
        
        contentScroll.setContentOffset(CGPointMake(0, 120), animated: true);
    }
    
    func willHideKeyBoard(notification : NSNotification){
        
        contentScroll.setContentOffset(CGPointMake(0, 0), animated: true);
    }
    func textFieldShouldReturn (textField: UITextField!) -> Bool{
        if ((textField == txtUsername)){
            txtPassword.becomeFirstResponder();
        } else if (textField == txtPassword){
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func loginSuccessful() {
        var appDelegate : AppDelegate! = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.loginSuccessful()
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
