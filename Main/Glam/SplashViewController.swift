//
//  SplashViewController.swift
//  Glam
//
//  Created by Rajkumar Sharma on 28/09/14.
//  Copyright (c) 2014 MyAppTemplates. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true;
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
          self.navigationController?.navigationBar.hidden = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
